# Ignore .svn directories when autocompleting
export FIGNORE=.svn

svn-authors() {
    svn log -q | awk -F ' \\| ' '/^r/ { print $2 }' | sort -u
}

svn-dirty() {
    find . -type d -exec test -d '{}'/.svn ';' -prune -print | xargs svn stat
}
