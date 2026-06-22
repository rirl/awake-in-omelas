#!/bin/bash
## Automated Script with Adaptive Parsing and JUnit Reports

# Define colors for terminal output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# 1. Detect JSON parser capability
if command -v jq >/dev/null 2>&1; then
    HAS_JQ=true
    echo "Parser: Using fine-grained 'jq' for JSON parsing."
else
    HAS_JQ=false
    echo "Parser: 'jq' not found. Falling back to 'grep' text parsing."
fi

# Track test states (0 = pass, 1 = fail)
T1_STATUS=0; T2_STATUS=0; T3_STATUS=0
T1_MSG=""; T2_MSG=""; T3_MSG=""

# ----------------------------------------------------------------
# TEST 1: Initialize Verification (src/index.ts)
# ----------------------------------------------------------------
echo -e "\n[Test 1/3] Verifying server initialization..."
PAYLOAD_1='{"jsonrpc": "2.2", "method": "initialize", "params": {"protocolVersion": "2024-11-05", "capabilities": {}, "clientInfo": {"name": "test", "version": "1.0"}}, "id": 1}'

RESPONSE_1=$(echo "$PAYLOAD_1" | npx tsx src/index.ts 2>/dev/null)
if [ "$HAS_JQ" = true ]; then
    VERSION=$(echo "$RESPONSE_1" | jq -r '.result.protocolVersion // empty')
    if [ -n "$VERSION" ]; then
        echo -e "${GREEN}✔ PASS:${NC} Handshake verified. Protocol: $VERSION"
    else
        T1_STATUS=1; T1_MSG="Missing .result.protocolVersion in JSON output"
    fi
else
    if echo "$RESPONSE_1" | grep -q '"protocolVersion"'; then
        echo -e "${GREEN}✔ PASS:${NC} Handshake verified via substring match."
    else
        T1_STATUS=1; T1_MSG="Missing expected 'protocolVersion' signature text"
    fi
fi

if [ $T1_STATUS -eq 1 ]; then
    echo -e "${RED}✘ FAIL:${NC} $T1_MSG"
fi

# ----------------------------------------------------------------
# TEST 2: List Directory Verification (dist/index.js)
# ----------------------------------------------------------------
echo -e "\n[Test 2/3] Verifying 'list_directory' execution..."
PAYLOAD_2='{"jsonrpc": "2.2", "method": "tools/call", "params": {"name": "list_directory", "arguments": {"path": "."}}, "id": 3}'

RESPONSE_2=$(echo "$PAYLOAD_2" | node dist/index.js /app 2>/dev/null)
if [ "$HAS_JQ" = true ]; then
    IS_ERR=$(echo "$RESPONSE_2" | jq -r '.result.isError // false')
    HAS_CONTENT=$(echo "$RESPONSE_2" | jq -r '.result.content // empty')
    if [ "$IS_ERR" = "false" ] && [ -n "$HAS_CONTENT" ]; then
        echo -e "${GREEN}✔ PASS:${NC} Directory listing response parsed successfully."
    else
        T2_STATUS=1; T2_MSG="JSON response signaled an execution error or missing content array"
    fi
else
    if echo "$RESPONSE_2" | grep -q '"content"' && ! echo "$RESPONSE_2" | grep -q '"isError":true'; then
        echo -e "${GREEN}✔ PASS:${NC} Directory listing verified via text layout bounds."
    else
        T2_STATUS=1; T2_MSG="String evaluation indicates failure or unexpected structural properties"
    fi
fi

if [ $T2_STATUS -eq 1 ]; then
    echo -e "${RED}✘ FAIL:${NC} $T2_MSG"
fi

# ----------------------------------------------------------------
# TEST 3: Write File Capability Verification (dist/index.js)
# ----------------------------------------------------------------
echo -e "\n[Test 3/3] Verifying file system mutations ('write_file')..."
TEST_FILE="mcp-write-test.txt"
rm -f "$TEST_FILE"

PAYLOAD_3='{"jsonrpc": "2.2", "method": "tools/call", "params": {"name": "write_file", "arguments": {"path": "'"$TEST_FILE"'", "content": "Token: XYZ123"}}, "id": 4}'
RESPONSE_3=$(echo "$PAYLOAD_3" | node dist/index.js /app 2>/dev/null)
if [ -f "$TEST_FILE" ]; then
    if [ "$HAS_JQ" = true ]; then
        IS_ERR=$(echo "$RESPONSE_3" | jq -r '.result.isError // false')
        [ "$IS_ERR" = "true" ] && T3_STATUS=1 && T3_MSG="Server flagged a protocol error despite writing artifact"
    else
        echo "$RESPONSE_3" | grep -q '"isError":true' && T3_STATUS=1 && T3_MSG="Text scanning uncovered an error state within payload"
    fi
else
    T3_STATUS=1; T3_MSG="Target mutation missing. File '$TEST_FILE' not generated inside workspace"
fi

if [ $T3_STATUS -eq 0 ]; then
    echo -e "${GREEN}✔ PASS:${NC} Host file created successfully."
    rm -f "$TEST_FILE"
else
    echo -e "${RED}✘ FAIL:${NC} $T3_MSG"
fi

# ----------------------------------------------------------------
# JUNIT XML GENERATION
# ----------------------------------------------------------------
TOTAL_ERRORS=$((T1_STATUS + T2_STATUS + T3_STATUS))

cat <<EOF > mcp-results.xml
<?xml version="1.0" encoding="UTF-8"?>
<testsuites name="MCP Server Protocol Validation">
  <testsuite name="mcp_server_filesystem_suite" tests="3" failures="${TOTAL_ERRORS}" errors="0">
    <testcase classname="mcp.server.init" name="test_initialization">
$( [ $T1_STATUS -eq 1 ] && echo "      <failure message=\"$T1_MSG\">$RESPONSE_1</failure>" )
    </testcase>
    <testcase classname="mcp.server.tools" name="test_list_directory">
$( [ $T2_STATUS -eq 1 ] && echo "      <failure message=\"$T2_MSG\">$RESPONSE_2</failure>" )
    </testcase>
    <testcase classname="mcp.server.mutations" name="test_write_file">
        $( [ $T3_STATUS -eq 1 ] && echo "      <failure message=\"$T3_MSG\">$T3_MSG. Output: $RESPONSE_3</failure>" )
    </testcase>
  </testsuite>
</testsuites>
EOF

echo -e "\n=================================================="
echo " JUnit report saved cleanly to 'mcp-results.xml'"
echo "=================================================="

# Exit with non-zero code if any test failed to break CI pipelines safely
exit $TOTAL_ERRORS
