if has atom; then
    EDITOR='atom -w'
else
    EDITOR="$(which vi)"
fi
export EDITOR

export GIT_EDITOR=$(which vim)
