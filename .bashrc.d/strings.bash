str_split() {
    local sep="$1"
    sed "s/$sep/"$'\\\n'"/g"
}

str_join() {
    local sep="$1"
    awk 'BEGIN { ORS="'"$sep"'" } ; { print }' | sed "s/$sep\$//"
}