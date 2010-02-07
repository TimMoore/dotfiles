# With thanks to Todd Werth
# http://blog.infinitered.com/entries/show/4

# Include host-specific .bash_profile file
[ -f ~/.bash_profile.`hostname -s` ] && . ~/.bash_profile.`hostname -s`

# Include .bashrc
[ -f ~/.bashrc ] && . ~/.bashrc
