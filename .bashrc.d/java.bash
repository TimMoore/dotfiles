fail() {
    find . -path "*/surefire-reports/*.txt" |xargs grep -l "'FAILURE'" |xargs mate
}

idea() {
    # Grab the latest version of IDEA:
    #   1. List all of the directories that match the IDEA filename pattern.
    #   2. Numerically sort each line by the version number field.
    #   3. Pull out the last line.
    local IDEA=`ls -d /Applications/IntelliJ\ IDEA\ * \
        | sort -n -k3 \
        | tail -n1`

    if [ -f "${1}" ]; then      # first, try any filename provided
        open -a "${IDEA}" "${1}"
    elif [ -f pom.xml ]; then # second, try pom.xml
        open -a "${IDEA}" pom.xml
    elif [ -f *.ipr ]; then   # third, try any IDEA project files
        open -a "${IDEA}" "$(ls -1d *.ipr | head -n1)"
    else                      # finally, just open IDEA
        open "${IDEA}"
    fi
}

unjar() {
    local file="$(find "$(pwd)" -name "${1}")"
    local dir="$(dirname "${file}")"
    local base="$(basename -s .jar "${file}")"
    mkdir "${dir}/${base}"
    cd "${dir}/${base}"
    jar xf "${file}"
}
