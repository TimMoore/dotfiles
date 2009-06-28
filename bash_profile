# With thanks to Todd Werth
# http://blog.infinitered.com/entries/show/4

# Set PATH
if [ -d /opt/local ]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export MANPATH=/opt/local/share/man:$MANPATH
fi

# Include host-specific .bash_profile file
[ -f ~/.bash_profile.`hostname` ] && . ~/.bash_profile.`hostname`

# Include .bashrc
[ -f ~/.bashrc ] && . ~/.bashrc
