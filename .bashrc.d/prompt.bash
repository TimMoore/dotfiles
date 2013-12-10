# Configure Git status in prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_DESCRIBE_STYLE=default
GIT_PS1_SHOWCOLORHINTS=1

prompt_timestamp="$(_prompt_color SOLARIZED_${SOLARIZED_MODE}_COMMENTS '[\t]')"
prompt_path="$(_prompt_color SOLARIZED_COLOR_BLUE '\w')"

PROMPT_COMMAND="__git_ps1 '$prompt_timestamp \u@\h:$prompt_path' ' \$ '; $PROMPT_COMMAND"
