is_rx_dir() {
    local dir="${1}"

    [[ -d "${dir}" && -r "${dir}" && -x "${dir}" ]]
}

prepend_to_path() {
    local dir="${1}" path="${2}"

    # This prints the value of dir, then if path is defined,
    # print a colon, then the value of path.
    echo "${dir}${path:+:${path}}"
}

path_first_element() {
    local path="${1}"
    echo "${path%%:*}"
}

path_remaining_elements() {
    local path="${1}"
    echo "${path##+([^:])?(:)}"
}

remove_from_path() {
    local remove="${1}" path="${2}"

    if [[ -n "${path}" ]]; then
        local dir="$(path_first_element "${path}")"
        local rest="$(path_remaining_elements "${path}")"

        [[ -n "${rest}" ]] &&
            rest="$(remove_from_path "${remove}" "${rest}")"

        if [[ "${dir}" = "${remove}" ]]; then
            echo "${rest}"
        else
            prepend_to_path "${dir}" "${rest}"
        fi
    fi
}

# This can be used to prepend one or more directories to a path-like string.
#
# Usage:
#   prepend_path <path-fragment> <path-string>
#
# The path fragment can be a single directory name, or a list of directories
# delimited by colon (:) characters, in the form of the PATH environment
# variable and other similar variables.
#
# The path string has the same format, but is usually expanded from an
# environment variable rather than specified literally.
#
# If the directory is already contained within the path, it is moved to the
# beginning of the path. The resulting path string is written to stdout.
#
# Examples:
#   $ PATH="$(prepend_path /usr/local/bin ${PATH})"
#   $ PATH="$(prepend_path /opt/local/bin:/opt/local/sbin ${PATH})"
#   $ MANPATH="$(prepend_path /usr/local/man ${MANPATH})"
#

prepend_path() {
    local path_fragment="${1}" path="${2}"

    if [[ -n "${path_fragment}" ]]; then
        # Take the first directory off the path fragment:
        local dir="$(path_first_element "${path_fragment}")"
        path="$(remove_from_path "${dir}" "${path}")"

        if is_rx_dir "${dir}"; then
            # The remaining path fragment:
            local rest="$(path_remaining_elements "${path_fragment}")"

            path="$(prepend_path "${rest}" "${path}")"
            prepend_to_path "${dir}" "${path}"
        else
            echo "${path}"
        fi
    else
        echo "${path}"
    fi
}

add_prefix() {
    local prefix="${1}"

    PATH="$(prepend_path "${prefix}/bin:${prefix}/sbin" ${PATH})"
}

# Let apps in /usr/local override everything
add_prefix "/usr/local"
add_prefix "/usr/local/opt/ruby"
add_prefix "${HOME}/.cabal"

export PATH
