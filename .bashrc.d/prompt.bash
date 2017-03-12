# Configure Git status in prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_DESCRIBE_STYLE=default
GIT_PS1_SHOWCOLORHINTS=1

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

    add_prompt_cmd reset_window_title
    add_prompt_cmd "__git_ps1 '${git_ps1_prefix}' '${git_ps1_suffix}'"

    # self-destruct to avoid polluting the namespace
    unset prompt_escape prompt_color add_prompt_cmd init_prompt
}
init_prompt
