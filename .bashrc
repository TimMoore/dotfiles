# With thanks to Todd Werth
# http://blog.infinitered.com/entries/show/4

# Colors!

export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1

export COLOR_NC='\033[0m' # No Color
export COLOR_WHITE='\033[1;37m'
export COLOR_BLACK='\033[0;30m'
export COLOR_BLUE='\033[0;34m'
export COLOR_LIGHT_BLUE='\033[1;34m'
export COLOR_GREEN='\033[0;32m'
export COLOR_LIGHT_GREEN='\033[1;32m'
export COLOR_CYAN='\033[0;36m'
export COLOR_LIGHT_CYAN='\033[1;36m'
export COLOR_RED='\033[0;31m'
export COLOR_LIGHT_RED='\033[1;31m'
export COLOR_PURPLE='\033[0;35m'
export COLOR_LIGHT_PURPLE='\033[1;35m'
export COLOR_BROWN='\033[0;33m'
export COLOR_YELLOW='\033[1;33m'
export COLOR_GRAY='\033[0;30m'
export COLOR_LIGHT_GRAY='\033[0;37m'

alias colorslist="env | egrep 'COLOR_\w*'"  # lists all the colors

function colors() {
	local color
	for color in `colorslist -o`
		do echo -e "${!color}$color$COLOR_NC"
	done
}

# Try to determine whether the 'ls' command on this system
# supports the "--color" option

if $(ls --color >/dev/null 2>&1); then
    alias ls='ls --color=auto';
fi

PS1="\[$COLOR_BLUE\]\u@\h:\w\n"
PS1="$PS1\[$COLOR_RED\]\${CURRENT_MODE:+[\$CURRENT_MODE] }"
PS1="$PS1\[$COLOR_GREEN\]\d \t \[$COLOR_GRAY\]\$ \[$COLOR_NC\]"

# Useful shell aliases

alias ..='cd ..'
alias ....='..;..'

# bash/readline options

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

# Ignore .svn directories when autocompleting
export FIGNORE=.svn

# Environment

if [ -n "`which mate`" ]; then
    EDITOR='mate -w'
else
    EDITOR=`which vi`
fi
export EDITOR

export MAVEN_OPTS="-Xmx256m -Dfile.encoding=ISO-8859-1 -Djava.awt.headless=true"


function rgb2hex() {
    perl -e '(shift @ARGV) =~ /rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)/ && printf "#%X%X%X\n", $1, $2, $3' "$@"
}

export HISTCONTROL=erasedups
export HISTSIZE=10000

# Development aliases and functions

function idea() {
    # grab the latest version of IDEA
    IDEA=`ls -1d /Applications/IntelliJ\ * | tail -n1`

    if [ -f "$1" ]; then      # first, try any filename provided
      open -a "$IDEA" "$1"
    elif [ -f pom.xml ]; then # second, try pom.xml
      open -a "$IDEA" pom.xml
    elif [ -f *.ipr ]; then   # third, try any IDEA project files
      open -a "$IDEA" `ls -1d *.ipr | head -n1`
    else                      # finally, just open IDEA
      open "$IDEA"
    fi
}

alias svn-dirty='find . -type d -exec test -d \{\}/.svn \; -prune -print|xargs svn stat'

# Include host-specific .bashrc file
[ -f ~/.bashrc.`hostname -s` ] && . ~/.bashrc.`hostname -s`

# Include everything in .bashrc.d
if [ -d ~/.bashrc.d ]; then
	for bashrc in ~/.bashrc.d/*; do
	    [ -f $bashrc ] || continue
		. $bashrc
	done
fi

