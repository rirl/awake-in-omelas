#!/usr/bin/env bash

set -euo pipefail

if ! git rev-parse --show-toplevel >/dev/null 2>&1; then
    echo "Error: must be run from within a git repository." >&2
    exit 1
fi

ROOT_DIR="$(git rev-parse --show-toplevel)"
README_FILE="${ROOT_DIR}/README.adoc"

echo "Bootstrapping canon repository structure under:"
echo "  ${ROOT_DIR}"
echo

mkdir -p \
    "${ROOT_DIR}/scripts" \
    "${ROOT_DIR}/templates" \
    "${ROOT_DIR}/canon/checkpoints" \
    "${ROOT_DIR}/canon/characters" \
    "${ROOT_DIR}/canon/timeline" \
    "${ROOT_DIR}/canon/artifacts" \
    "${ROOT_DIR}/canon/symbols" \
    "${ROOT_DIR}/canon/themes" \
    "${ROOT_DIR}/canon/mysteries" \
    "${ROOT_DIR}/canon/revelation" \
    "${ROOT_DIR}/canon/worldbuilding" \
    "${ROOT_DIR}/canon/narrative-architecture" \
    "${ROOT_DIR}/canon/provenance" \
    "${ROOT_DIR}/canon/source-fragments" \
    "${ROOT_DIR}/canon/audits" \
    "${ROOT_DIR}/canon/infrastructure/prompts" \
    "${ROOT_DIR}/canon/indexes"

find "${ROOT_DIR}/canon" "${ROOT_DIR}/templates" -type d \
    -exec touch "{}/.gitkeep" \;


if [[ ! -f "${README_FILE}" ]]; then
    cat > "${README_FILE}" <<'EOF'
= Awake in Omelas Canon Repository

Status: Infrastructure Bootstrap

This repository is the authoritative source of truth for all canonical
story information related to Awake in Omelas.

The repository preserves:

* Canonical facts
* Narrative decisions
* Provenance
* Symbolism
* Revelation order
* Character knowledge states
* Timeline information
* Historical checkpoints

The repository is designed to allow reconstruction of project state
independent of chat history.
EOF
fi

echo "Created or verified:"
echo "  canon/"
echo "  templates/"
echo "  scripts/"
echo "  README.adoc"
echo
echo "Bootstrap complete."