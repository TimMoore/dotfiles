if [ -n "$(which less)" ]; then
    PAGER="$(which less)"
    LESS="FSRX"
    export PAGER LESS
fi
