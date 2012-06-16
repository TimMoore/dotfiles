# Convenient aliases for jumping up the directory tree
#
alias ..='cd ..;'
alias ...='.. ..'
alias ....='.. .. ..'

emptydirs() {
    find . -not '(' -name .svn -prune ')' -type d \
        -exec sh -c '[ $(ls -1 "{}" | wc -l) -eq 0 ]' ';' \
        -print
}
