#!/usr/bin/env bash

parse_force_arg() {
    FORCE=0

    if [[ "${1:-}" == "--force" ]]; then
        FORCE=1
    elif [[ $# -gt 0 ]]; then
        echo "Usage: $0 [--force]" >&2
        exit 1
    fi
}

require_repo_root() {
    if [[ ! -d "canon" || ! -d "scripts" ]]; then
        echo "ERROR: run this script from the repository root." >&2
        exit 1
    fi
}

write_file() {
    local path="$1"

    if [[ -e "$path" && "${FORCE:-0}" -ne 1 ]]; then
        echo "SKIP  $path"
        return
    fi

    mkdir -p "$(dirname "$path")"
    cat > "$path"
    echo "WRITE $path"
}

print_completion() {
    local label="$1"

    echo
    echo "$label bootstrap complete."

    if [[ "${FORCE:-0}" -eq 1 ]]; then
        echo "Mode: force overwrite enabled."
    else
        echo "Mode: safe; existing files were skipped."
    fi
}