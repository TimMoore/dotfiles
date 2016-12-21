if has brew; then
    try_to_source "$(brew --prefix)/etc/bash_completion"
fi
try_to_source "/etc/bash_completion"

source_everything_in ~/.bash_completion.d
