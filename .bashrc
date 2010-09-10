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

export MAVEN_OPTS="-Xms350m -Xmx512m -Dfile.encoding=ISO-8859-1 -Djava.awt.headless=true"

function rgb2hex() {
    perl -e '(shift @ARGV) =~ /rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)/ && printf "#%02X%02X%02X\n", $1, $2, $3' "$@"
}

function hex2rgb() {
    perl -e '(shift @ARGV) =~ /#([[:xdigit:]]{2}){3}/ && printf "rgb(%d, %d, %d)\n", $1, $2, $3' "$@";
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

PS1="\[$COLOR_BLUE\]\u@\h:\w\n"
PS1="$PS1\[$COLOR_RED\]\${CURRENT_MODE:+[\$CURRENT_MODE] }"
PS1="$PS1\[$COLOR_GREEN\]\d \t \[$COLOR_GRAY\]\$ \[$COLOR_NC\]"
