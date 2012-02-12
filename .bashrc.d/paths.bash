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

# Setting the path for MacPorts.
if [ -d "/opt/local" ]; then
    PATH="$(prepend_path "/opt/local/bin:/opt/local/sbin" "${PATH}")"
    MANPATH="$(prepend_path "/opt/local/share/man" "${MANPATH}")"
fi


# Let apps in /usr/local override everything
if [ -d "/usr/local" ]; then
    PATH="$(prepend_path "/usr/local/bin:/usr/local/sbin" "${PATH}")"
    MANPATH="$(prepend_path "/usr/local/share/man" "${MANPATH}")"
fi

export PATH MANPATH