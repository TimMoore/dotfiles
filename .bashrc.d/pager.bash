if which -s less; then
    PAGER="$(which less)"
    LESS="FSRX"
    export PAGER LESS
fi
