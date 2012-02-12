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
function prepend_path() {
    local path_fragment="${1}" path="${2}" dir
    # replace each ':' with a space in the path_fragment to loop over dirs
    for dir in ${path_fragment//:/ }; do
        path="${path//@(${dir}:|:${dir})/}" # strip dir from path
    done
    echo "${path_fragment}:${path}"
}

function is_rx_dir() {
    local dir="${1}"

    [[ -d "${dir}" && -r "${dir}" && -x "${dir}" ]]
}

function add_prefix() {
    local prefix="${1}"

    if is_rx_dir "${prefix}"; then
        is_rx_dir "${prefix}/sbin" &&
            PATH="$(prepend_path ${prefix}/sbin ${PATH})"
        is_rx_dir "${prefix}/bin" &&
            PATH="$(prepend_path ${prefix}/bin ${PATH})"
        is_rx_dir "${prefix}/share/man" &&
            MANPATH="$(prepend_path "${prefix}/share/man" "${MANPATH}")"
    fi
}

# Setting the path for MacPorts.
add_prefix "/opt/local"

# Let apps in /usr/local override everything
add_prefix "/usr/local"

export PATH MANPATH