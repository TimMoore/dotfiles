if has brew; then
    brew="$(brew --prefix)"
    try_to_source "${brew}/etc/bash_completion"
    try_to_source "${brew}/Library/Contributions/brew_bash_completion.sh"
fi
try_to_source "/etc/bash_completion"

source_everything_in ~/.bash_completion.d
