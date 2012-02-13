# With thanks to Todd Werth
# http://blog.infinitered.com/entries/show/4

# Colors!

COLOR_NC='\033[0m' # No Color
COLOR_NC_BOLD='\033[1m' # No Color

COLOR_BLACK='\033[0;30m'
COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_YELLOW='\033[0;33m'
COLOR_BLUE='\033[0;34m'
COLOR_MAGENTA='\033[0;35m'
COLOR_CYAN='\033[0;36m'
COLOR_WHITE='\033[0;37m'

COLOR_BLACK_BOLD='\033[1;30m'
COLOR_RED_BOLD='\033[1;31m'
COLOR_GREEN_BOLD='\033[1;32m'
COLOR_YELLOW_BOLD='\033[1;33m'
COLOR_BLUE_BOLD='\033[1;34m'
COLOR_MAGENTA_BOLD='\033[1;35m'
COLOR_CYAN_BOLD='\033[1;36m'
COLOR_WHITE_BOLD='\033[1;37m'

_prompt_escape() {
    echo "\[${@}\]"
}

_prompt_color() {
    local color="COLOR_${1}"; shift
    echo $(_prompt_escape "${!color}")${@}$(_prompt_escape "${COLOR_NC}")
}

PS1="$(_prompt_color NC_BOLD '[\t]')" # timestamp
PS1+=' '
PS1+="$(_prompt_color GREEN '\u@\h')" # user@host
PS1+=':'
PS1+="$(_prompt_color BLUE '\w')" # path
PS1+='\$ ' # no-color prompt

colors() {
    local color
    for color in "${!COLOR_@}"; do
        echo -e "${!color}${color}${COLOR_NC}"
    done
}

# Enable colors in various command-line tools
#
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1

# Try to determine whether the 'ls' command on
# this system supports the "--color" option
#
if $(ls --color >/dev/null 2>&1); then
    alias ls='ls --color=auto';
fi

# Colorful manpages
# Inspired by http://github.com/anveo/dotfiles
# and http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/

export LESS_TERMCAP_mb=$(echo -e "${COLOR_LIGHT_RED}") # 'blinking' text
export LESS_TERMCAP_md=$(echo -e "${COLOR_LIGHT_BLUE}") # 'bold' text

export LESS_TERMCAP_us=$(echo -e "${COLOR_LIGHT_GREEN}") # 'underlined' text
export LESS_TERMCAP_ue=$(echo -e "${COLOR_NC}") # end 'underlined' text

export LESS_TERMCAP_so=$'\E[01;44;33m' # 'standout' mode
# (blue highlight, bold brown text)
export LESS_TERMCAP_se=$(echo -e "${COLOR_NC}") # end 'standout' mode

export LESS_TERMCAP_me=$(echo -e "${COLOR_NC}") # end appearance modes


function rgb2hex() {
    perl -e '
        (shift @ARGV) =~
            /rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)/ &&
                printf "#%02X%02X%02X\n", $1, $2, $3
    ' \
    "${@}"
}

function hex2rgb() {
    perl -e '
        (shift @ARGV) =~
            /#?([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2})/ &&
                printf "rgb(%d, %d, %d)\n", hex($1), hex($2), hex($3)
    ' \
    "${@}";
}
