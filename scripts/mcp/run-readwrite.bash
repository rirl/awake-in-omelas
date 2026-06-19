#!/usr/bin/env bash

docker run -i --rm   --mount type=bind,src="$(pwd)",dst=/workspace/awake-in-omelas   mcp/filesystem   /workspace/awake-in-omelas
