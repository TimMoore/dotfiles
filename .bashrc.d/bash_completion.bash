if [ -n "`which brew`" ]; then
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
    if [ -f `brew --prefix`/Library/Contributions/brew_bash_completion.sh ]; then
        . `brew --prefix`/Library/Contributions/brew_bash_completion.sh
    fi
elif [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

source_everything_in ~/.bash_completion.d
