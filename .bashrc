# Utility functions used in the rest of the script

try_to_source() {
    local file="$1"

    [[ -f $file && -r $file ]] && . $file
}

source_everything_in() {
    local dir="$1"

    if [[ -d $dir && -r $dir && -x $dir ]]; then
        for file in "$dir"/*; do
           try_to_source $file
        done
    fi
}

# bash/readline/tty options

# Disable locale-sensitive string comparison for performance
export LC_ALL=C
# Turn UTF-8 on explicitly for less, which
# otherwise assumes latin-1 with LC_ALL=C
export LESSCHARSET=utf-8

# Disable ctrl-s and ctrl-q for starting and stopping the terminal
stty -ixon -ixoff stop undef start undef

export HISTCONTROL=ignoredups # Ignores dupes in the history

bind "set completion-ignore-case on"
bind "set bell-style none"
bind "set show-all-if-ambiguous on"

if [ -n "`which brew`" ]; then
    if [ -d "`brew --prefix`/bin" ]; then
        PATH="`brew --prefix`/bin:${PATH//`brew --prefix`\/bin?(:)}"
    fi
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

# Environment

if [ -n "`which mate`" ]; then
    EDITOR='mate -w'
    export GIT_EDITOR='mate -w -l 1'
else
    EDITOR=`which vi`
fi
export EDITOR

if [ -n "`which less`" ]; then
    PAGER="`which less`"
    LESS="FSRX"
    export PAGER LESS
fi

export HISTCONTROL=erasedups
export HISTSIZE=10000

# Development aliases and functions

source_everything_in ~/.bashrc.d

# Source host-specific .bashrc file
[ -f ~/.bashrc.`hostname -s` ] && . ~/.bashrc.`hostname -s`

PS1='\['"$COLOR_LIGHT_GREEN"'\][\t]\['"$COLOR_NC"'\]' # timestamp
PS1+=' \['$COLOR_GREEN'\]\u@\h\['$COLOR_NC'\]' # user@host
PS1+=':\['$COLOR_BLUE'\]\w\['$COLOR_NC'\]' # path
PS1+='\$ ' # no-color prompt
