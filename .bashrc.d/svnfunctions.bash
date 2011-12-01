svn-authors() {
    svn log -q | awk -F ' \\| ' '/^r/ { print $2 }' | sort -u
}