#!/usr/bin/env bash
#
# Repository Responsibility Assessment
# Evidence Bootstrap
#
# Purpose:
#   Collect repository inventory evidence for RRA-0001.
#
# Usage:
#   scripts/governance/bootstrap-repository-responsibility-evidence.bash
#   scripts/governance/bootstrap-repository-responsibility-evidence.bash --apply
#
# Behavior:
#   - Dry-run by default.
#   - Writes evidence only when --apply is supplied.
#   - Never overwrites an existing evidence file.
#   - Records repository, branch, commit, timestamp, description, and command.
#   - Excludes the generated evidence directory from the artifacts inventory.
#

set -euo pipefail

readonly EXPECTED_REPOSITORY_NAME="awake-in-omelas"
readonly EVIDENCE_DIR="artifacts/governance/repository-responsibility/evidence"

APPLY=false

usage() {
    cat <<'EOF'
Usage:
  bootstrap-repository-responsibility-evidence.bash [--apply]

Options:
  --apply   Create the planned evidence files.
  --help    Display this help.

Without --apply, the script performs a dry run.

Existing evidence files are never overwritten.
EOF
}

fail() {
    printf 'ERROR: %s\n' "$*" >&2
    exit 1
}

while (($# > 0)); do
    case "$1" in
        --apply)
            APPLY=true
            ;;
        --help|-h)
            usage
            exit 0
            ;;
        *)
            fail "Unknown argument: $1"
            ;;
    esac

    shift
done

command -v git >/dev/null 2>&1 || fail "git is required."
command -v find >/dev/null 2>&1 || fail "find is required."
command -v sort >/dev/null 2>&1 || fail "sort is required."
command -v date >/dev/null 2>&1 || fail "date is required."
command -v mktemp >/dev/null 2>&1 || fail "mktemp is required."

git rev-parse --is-inside-work-tree >/dev/null 2>&1 \
    || fail "Run this script from inside a Git repository."

REPO_ROOT="$(git rev-parse --show-toplevel)"
REPO_NAME="$(basename "$REPO_ROOT")"
BRANCH_NAME="$(git branch --show-current)"
COMMIT_ID="$(git rev-parse HEAD)"
GENERATED_AT="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

if [[ "$REPO_NAME" != "$EXPECTED_REPOSITORY_NAME" ]]; then
    fail "Expected repository '${EXPECTED_REPOSITORY_NAME}', found '${REPO_NAME}'."
fi

cd "$REPO_ROOT"

echo
echo "==============================================="
echo " Repository Responsibility Assessment Bootstrap"
echo "==============================================="
echo
echo "Repository : $REPO_NAME"
echo "Root       : $REPO_ROOT"
echo "Branch     : ${BRANCH_NAME:-DETACHED}"
echo "Commit     : $COMMIT_ID"
echo "Generated  : $GENERATED_AT"
echo

if [[ "$APPLY" == true ]]; then
    mkdir -p "$EVIDENCE_DIR"
    echo "Mode       : APPLY"
else
    echo "Mode       : DRY RUN"
fi

echo

collect() {
    local evidence_filename="$1"
    local description="$2"
    local command_text="$3"

    local destination="${EVIDENCE_DIR}/${evidence_filename}"

    echo "-----------------------------------------------"
    echo "$evidence_filename"
    echo "$description"
    echo "-----------------------------------------------"

    if [[ -e "$destination" ]]; then
        echo "SKIP : $destination already exists."
        echo
        return
    fi

    if [[ "$APPLY" == false ]]; then
        echo "DRY RUN"
        echo "Would create:"
        echo "  $destination"
        echo
        echo "Command:"
        echo "  $command_text"
        echo
        return
    fi

    local temporary_file
    temporary_file="$(mktemp)"

    {
        echo "Repository Responsibility Assessment (RRA-0001)"
        echo "Evidence   : $evidence_filename"
        echo "Repository : $REPO_NAME"
        echo "Branch     : ${BRANCH_NAME:-DETACHED}"
        echo "Commit     : $COMMIT_ID"
        echo "Generated  : $GENERATED_AT"
        echo
        echo "Description:"
        echo "  $description"
        echo
        echo "Command:"
        echo "  $command_text"
        echo
        echo "------------------------------------------------------------"
        echo

        bash -c "$command_text"
    } >"$temporary_file"

    if [[ ! -s "$temporary_file" ]]; then
        rm -f "$temporary_file"
        fail "Generated evidence was empty: $evidence_filename"
    fi

    mv "$temporary_file" "$destination"

    echo "Created:"
    echo "  $destination"
    echo
}

collect \
    "E-001-top-level-inventory.txt" \
    "Top-level repository inventory" \
    "find . -mindepth 1 -maxdepth 1 ! -name '.git' -print | sort"

collect \
    "E-002-artifacts-tree.txt" \
    "Artifacts directory inventory excluding generated assessment evidence" \
    "find artifacts -path 'artifacts/governance/repository-responsibility/evidence' -prune -o -print | sort"

collect \
    "E-003-docs-tree.txt" \
    "Documentation directory inventory" \
    "find docs -print | sort"

collect \
    "E-004-scripts-tree.txt" \
    "Scripts directory inventory" \
    "find scripts -print | sort"

collect \
    "E-005-canon-tree.txt" \
    "Canon directory inventory" \
    "find canon -print | sort"

collect \
    "E-006-templates-tree.txt" \
    "Templates directory inventory" \
    "find templates -print | sort"

echo "Done."

if [[ "$APPLY" == false ]]; then
    echo
    echo "No evidence files were created."
    echo "Review the planned actions, then run:"
    echo
    echo "  scripts/governance/bootstrap-repository-responsibility-evidence.bash --apply"
fi