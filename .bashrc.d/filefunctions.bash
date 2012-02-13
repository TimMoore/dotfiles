# Define a "trash" function on systems with a ~/.Trash directory.
# This just moves the named files (or directories) to the trash.
#
if [ -d ~/.Trash ]; then
    function trash {
        if [ ${#} -lt 1 ]; then
            echo 1>&2 "usage: trash file ..."
            return 64 # 64 is the EX_USAGE exit code on BSD
        fi
        mv "${@}" ~/.Trash
    }
fi

# Convenient aliases for jumping up the directory tree
#
alias ..='cd ..;'
alias ...='.. ..'
alias ....='.. .. ..'

function emptydirs {
    find . -not \( -name .svn -prune \) -type d -exec sh -c '[ $(ls -1 "{}" | wc -l) -eq 0 ]' \; -print
}
