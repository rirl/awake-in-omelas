#!/usr/bin/env bash
set -euo pipefail

declare -ra REQUIRED_VARIABLES=(
    MCP
    MCP_CONTAINER_NAME
    MCP_CONTAINER_PORT
    MCP_CONTAINER_WORKSPACE
    MCP_HOST_PORT
    MCP_PROJECT_PATH
)

ACCESS_MODE="${1:-}"

validate_access_mode() {
    if [[ -z "${ACCESS_MODE}" ]]; then
        echo "missing, null, or empty argument: ACCESS_MODE" >&2
        echo "expected exactly one of: readonly, readwrite" >&2
        exit 1
    fi

    case "${ACCESS_MODE}" in
        readonly)
            declare -gr MCP_ACCESS_SUFFIX="RO"
            declare -gr MCP_ACCESS_VOLUME="ro"
            declare -gra MCP_CONTAINER_OPTIONS=(--read-only)
            ;;
        readwrite)
            declare -gr MCP_ACCESS_SUFFIX="RW"
            declare -gr MCP_ACCESS_VOLUME="rw"
            declare -ga MCP_CONTAINER_OPTIONS=()
            ;;
        *)
            echo "invalid ACCESS_MODE: ${ACCESS_MODE}" >&2
            echo "expected exactly one of: readonly, readwrite" >&2
            exit 1
            ;;
    esac
}

validate_required_variables() {
    local missing_count=0
    local variable_name
    local variable_value
    local -a required_variables

    mapfile -t required_variables < <(
        printf '%s\n' "${REQUIRED_VARIABLES[@]}" | sort
    )

    echo
    echo "Required environment variables"
    echo "=============================="
    echo

    for variable_name in "${required_variables[@]}"; do
        variable_value="${!variable_name:-}"

        if [[ -z "${variable_value}" ]]; then
            printf '%-32s : MISSING\n' "${variable_name}"
            missing_count=$((missing_count + 1))
        else
            printf '%-32s : %s\n' "${variable_name}" "${variable_value}"
        fi
    done

    echo

    if ((missing_count > 0)); then
        echo "ERROR: ${missing_count} required environment variable(s) are missing." >&2
        exit 1
    fi
}

validate_repository_state() {
    local current_branch

    if [[ ! -d "${MCP_PROJECT_PATH}" ]]; then
        echo "ERROR: MCP_PROJECT_PATH does not exist: ${MCP_PROJECT_PATH}" >&2
        exit 1
    fi

    if ! git -C "${MCP_PROJECT_PATH}" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "ERROR: MCP_PROJECT_PATH is not a Git repository: ${MCP_PROJECT_PATH}" >&2
        exit 1
    fi

    if ! current_branch="$(
        git -C "${MCP_PROJECT_PATH}" symbolic-ref --quiet --short HEAD
    )"; then
        echo "ERROR: repository HEAD is detached: ${MCP_PROJECT_PATH}" >&2
        exit 1
    fi

    if [[ "${ACCESS_MODE}" == "readwrite" ]]; then
        if [[ "${current_branch}" != feature/* ]]; then
            echo "ERROR: read-write access requires a feature/* branch." >&2
            echo "Current branch: ${current_branch}" >&2
            exit 1
        fi

        if [[ -n "$(git -C "${MCP_PROJECT_PATH}" status --porcelain)" ]]; then
            echo "ERROR: read-write access requires a clean working tree." >&2
            exit 1
        fi
    fi

    printf '%-32s : %s\n' "MCP_PROJECT_BRANCH" "${current_branch}"
}

set_derived_values() {
    local project_uid
    local project_gid

    project_uid="$(stat --format='%u' "${MCP_PROJECT_PATH}")"
    project_gid="$(stat --format='%g' "${MCP_PROJECT_PATH}")"

    if [[ ! "${project_uid}" =~ ^[0-9]+$ ]]; then
        echo "ERROR: unable to determine numeric repository owner UID." >&2
        exit 1
    fi

    if [[ ! "${project_gid}" =~ ^[0-9]+$ ]]; then
        echo "ERROR: unable to determine numeric repository owner GID." >&2
        exit 1
    fi

    declare -gr MCP_EFFECTIVE_CONTAINER_NAME="${MCP_CONTAINER_NAME}${MCP_ACCESS_SUFFIX}"
    declare -gr MCP_PROJECT_UID="${project_uid}"
    declare -gr MCP_PROJECT_GID="${project_gid}"
    declare -gr MCP_CONTAINER_USER="${MCP_PROJECT_UID}:${MCP_PROJECT_GID}"
}

print_derived_values() {
    echo
    echo "Derived values"
    echo "=============="
    echo

    printf '%-32s : %s\n' "ACCESS_MODE" "${ACCESS_MODE}"
    printf '%-32s : %s\n' "MCP_ACCESS_SUFFIX" "${MCP_ACCESS_SUFFIX}"
    printf '%-32s : %s\n' "MCP_ACCESS_VOLUME" "${MCP_ACCESS_VOLUME}"
    printf '%-32s : %s\n' "MCP_CONTAINER_USER" "${MCP_CONTAINER_USER}"

    if ((${#MCP_CONTAINER_OPTIONS[@]} == 0)); then
        printf '%-32s : %s\n' "MCP_CONTAINER_OPTIONS" "none"
    else
        printf '%-32s : %s\n' "MCP_CONTAINER_OPTIONS" "${MCP_CONTAINER_OPTIONS[*]}"
    fi

    printf '%-32s : %s\n' "MCP_EFFECTIVE_CONTAINER_NAME" "${MCP_EFFECTIVE_CONTAINER_NAME}"
    echo
}

run_container() {
    set -x
    docker run --rm -it \
        --name "${MCP_EFFECTIVE_CONTAINER_NAME}" \
        --user "${MCP_CONTAINER_USER}" \
        "${MCP_CONTAINER_OPTIONS[@]}" \
        --security-opt no-new-privileges:true \
        -p "127.0.0.1:${MCP_HOST_PORT}:${MCP_CONTAINER_PORT}" \
        -v "${MCP_PROJECT_PATH}:${MCP_CONTAINER_WORKSPACE}:${MCP_ACCESS_VOLUME}" \
        "${MCP}" \
        "${MCP_CONTAINER_WORKSPACE}"
    set +x
}

main() {
    validate_access_mode
    validate_required_variables
    validate_repository_state
    set_derived_values
    print_derived_values
    run_container
}

main "$@"
