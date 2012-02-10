if which -s mate; then
    EDITOR='mate -w'
    export GIT_EDITOR='mate -w -l 1'
else
    EDITOR=`which vi`
fi
export EDITOR
