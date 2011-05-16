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

# Ignore .svn directories when autocompleting
export FIGNORE=.svn

# Environment

if [ -n "`which mate`" ]; then
    EDITOR='mate -w'
else
    EDITOR=`which vi`
fi
export EDITOR

if [ -n "`which less`" ]; then
    PAGER="`which less`"
    LESS="FSRX"
    export PAGER LESS
fi

export MAVEN_OPTS="-Xms256m -Xmx512m -Dfile.encoding=ISO-8859-1 -Djava.awt.headless=true -XX:+UseCompressedOops"

function rgb2hex() {
    perl -e '(shift @ARGV) =~ /rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)/ && printf "#%02X%02X%02X\n", $1, $2, $3' "$@"
}

function hex2rgb() {
    perl -e '(shift @ARGV) =~ /#([[:xdigit:]]{2}){3}/ && printf "rgb(%d, %d, %d)\n", $1, $2, $3' "$@";
}

export HISTCONTROL=erasedups
export HISTSIZE=10000

# Development aliases and functions

alias svn-dirty='find . -type d -exec test -d \{\}/.svn \; -prune -print|xargs svn stat'

source_everything_in ~/.bashrc.d

# Source host-specific .bashrc file
[ -f ~/.bashrc.`hostname -s` ] && . ~/.bashrc.`hostname -s`

#PS1="\[$COLOR_BLUE\]\u@\h:\w\n"
#PS1="$PS1\[$COLOR_RED\]\${CURRENT_MODE:+[\$CURRENT_MODE] }"
#PS1="$PS1\[$COLOR_GREEN\]\d \t \[$COLOR_GRAY\]\$ \[$COLOR_NC\]"
PS1="\[$COLOR_WHITE\][\t]\[$COLOR_NC\] \[$COLOR_LIGHT_GREEN\]\u@\h\[$COLOR_NC\]:\[$COLOR_BLUE\]\w\[$COLOR_NC\]\\$ "
