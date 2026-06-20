#!/usr/bin/env bash
set -euo pipefail

require_arg() {
    local name="${1:?missing name}"
    local value="${2:-}"

    if [[ -z "${value}" ]]; then
        echo "missing, null, or empty argument: ${name}" >&2
        exit 1
    fi
}

require_variable() {
    local name="${1:?missing variable name}"
    local value="${!name:-}"

    if [[ -z "${value}" ]]; then
        echo "missing, null, or empty environment variable: ${name}" >&2
        exit 1
    fi
}

ACCESS_MODE="${1:-}"

require_arg ACCESS_MODE "${ACCESS_MODE}"

require_variable MCP
require_variable MCP_CONTAINER_NAME
require_variable MCP_HOST_PORT
require_variable MCP_CONTAINER_PORT
require_variable MCP_PROJECT_PATH
require_variable MCP_CONTAINER_WORKSPACE

case "${ACCESS_MODE}" in
    readonly)
        MCP_ACCESS_SUFFIX="RO"
        MCP_ACCESS_VOLUME="ro"
        MCP_CONTAINER_OPTIONS=(--read-only)
        ;;
    readwrite)
        MCP_ACCESS_SUFFIX="RW"
        MCP_ACCESS_VOLUME="rw"
        MCP_CONTAINER_OPTIONS=()
        ;;
    *)
        echo "invalid ACCESS_MODE: ${ACCESS_MODE}" >&2
        echo "expected exactly one of: readonly, readwrite" >&2
        exit 1
        ;;
esac

require_arg MCP_ACCESS_SUFFIX "${MCP_ACCESS_SUFFIX}"
require_arg MCP_ACCESS_VOLUME "${MCP_ACCESS_VOLUME}"

MCP_EFFECTIVE_CONTAINER_NAME="${MCP_CONTAINER_NAME}${MCP_ACCESS_SUFFIX}"

docker run --rm \
    --name "${MCP_EFFECTIVE_CONTAINER_NAME}" \
    "${MCP_CONTAINER_OPTIONS[@]}" \
    --security-opt no-new-privileges:true \
    -p "127.0.0.1:${MCP_HOST_PORT}:${MCP_CONTAINER_PORT}" \
    -v "${MCP_PROJECT_PATH}:${MCP_CONTAINER_WORKSPACE}:${MCP_ACCESS_VOLUME}" \
    "${MCP}"
