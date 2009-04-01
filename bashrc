# With thanks to Todd Werth
# http://blog.infinitered.com/entries/show/4

# Colors!

export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1

export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
alias colorslist="env | egrep 'COLOR_\w*'"  # lists all the colors
function colors() {
	local color
	for color in `colorslist -o`
		do echo -e "${!color}$color$COLOR_NC"
	done
}

PS1="\[$COLOR_BLUE\]\u@\h:\w\n"
PS1="$PS1\[$COLOR_RED\]\${CURRENT_MODE:+[\$CURRENT_MODE] }"
PS1="$PS1\[$COLOR_GREEN\]\d \t \[$COLOR_GRAY\]\$ \[$COLOR_NC\]"

# Useful shell aliases

alias ..='cd ..'
alias ....='..;..'

# bash/readline options

export HISTCONTROL=ignoredups # Ignores dupes in the history
shopt -s histappend

bind "set completion-ignore-case on"
bind "set bell-style none"
bind "set show-all-if-ambiguous on"

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# Ignore .svn directories when autocompleting
export FIGNORE=.svn

# Environment

export EDITOR='mate -w'

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
