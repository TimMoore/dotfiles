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

add_prompt_cmd() {
    PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }${@}"
}

init_prompt() {
    ps1_timestamp="$(_prompt_color ${base16_comment} '[\t]')"
    ps1_dir="$(_prompt_color ${ansi_fg_blue} '\w')"

    git_ps1_prefix="${ps1_timestamp} ${ps1_dir}"
    git_ps1_suffix=" \$ "

    add_prompt_cmd reset_window_title
    add_prompt_cmd "__git_ps1 '${git_ps1_prefix}' '${git_ps1_suffix}'"

    unset init_prompt # self-destruct to avoid polluting the namespace
}
init_prompt
