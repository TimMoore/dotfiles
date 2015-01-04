if has atom; then
    EDITOR='atom'
else
    EDITOR="$(which vi)"
fi
export EDITOR

export GIT_EDITOR=$(which vim)
