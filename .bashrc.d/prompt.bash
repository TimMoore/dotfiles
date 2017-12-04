# Configure Git status in prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_DESCRIBE_STYLE=default
GIT_PS1_SHOWCOLORHINTS=1

force_newline() {
    # Adapted from https://stackoverflow.com/q/19943482/29470
    # CSI 6n reports the cursor position as ESC[n;mR, where n is the row
    # and m is the column. Issue this control sequence and silently read
    # the resulting report until reaching the "R". By setting IFS to ";"
    # in conjunction with read's -a flag, fields are placed in an array.
    local curpos
    echo -en '\033[6n'
    IFS=';' read -s -d R -a curpos
    curpos[0]="${curpos[0]:2}"  # strip leading ESC[
    (( curpos[1] > 1 )) && echo -e '\033[7m%\033[0m'
}

reset_window_title() {
    # Sometimes, SSHing to a remote server will take over the window/tab title.
    # This clears it back to the default.
    printf '\e]0;\a'
}

init_prompt() {
    prompt_escape() {
        echo -n "\[${@}\]"
    }

    prompt_color() {
        local color="${1}"; shift
        prompt_escape "${color}"
        echo -n "${@}"
        prompt_escape "${ansi_reset}"
    }

    ps1_timestamp="$(prompt_color ${base16_comment} '[\t]')"
    ps1_dir="$(prompt_color ${ansi_fg_blue} '\w')"

    git_ps1_prefix="${ps1_timestamp} ${ps1_dir}"
    git_ps1_suffix=" \$ "

    add_prompt_cmd() {
        PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }${@}"
    }

    add_prompt_cmd force_newline
    add_prompt_cmd reset_window_title
    [[ $(type -t __git_ps1) == 'function' ]] && add_prompt_cmd "__git_ps1 '${git_ps1_prefix}' '${git_ps1_suffix}'"

    # self-destruct to avoid polluting the namespace
    unset prompt_escape prompt_color add_prompt_cmd init_prompt
}
init_prompt
