#!/usr/bin/env bash

docker run -i --rm \
--name "Omelas-MCP-RO" \
--mount type=bind,src="$(pwd)",dst=/workspace/awake-in-omelas,\
readonly \
mcp/filesystem \
/workspace/awake-in-omelas
