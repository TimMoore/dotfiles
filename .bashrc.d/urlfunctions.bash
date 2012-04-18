#
# URL encoding and decoding functions
# Borrowed from https://github.com/Daenyth/dotfiles/blob/master/.bashrc
#

urlencode() {
    local LANG=C
    arg="$1"
    i="0"
    while [ "$i" -lt ${#arg} ]; do
        c=${arg:$i:1}
        if echo "$c" | grep -q '[a-zA-Z/:_\.\-]'; then
            echo -n "$c"
        else
            echo -n "%"
            printf "%X" "'$c'"
        fi
        i=$((i+1))
    done
}

urldecode() {
    local LANG=C
    arg="$1"
    i="0"
    while [ "$i" -lt ${#arg} ]; do
        c0=${arg:$i:1}
        if [ "x$c0" = "x%" ]; then
            c1=${arg:$((i+1)):1}
            c2=${arg:$((i+2)):1}
            printf "\x$c1$c2"
            i=$((i+3))
        else
            echo -n "$c0"
            i=$((i+1))
        fi
    done
}
