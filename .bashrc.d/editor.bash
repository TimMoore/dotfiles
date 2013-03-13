if has mate; then
    EDITOR='mate -w'
else
    EDITOR="$(which vi)"
fi
export EDITOR

export GIT_EDITOR=$(which vim)
