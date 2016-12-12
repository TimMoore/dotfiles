## Variables used by bash:

# CDPATH
#      The search path for the cd command. This is a colon-separated list of
#      directories in which the shell looks for destination directories
#      specified by the cd command. A sample value is ".:~:/usr".
CDPATH=".:~:~/Projects:~/src"

# HISTCONTROL
#       A colon-separated list of values controlling how commands are saved on
#       the history list. If the list of values includes ignorespace, lines
#       which begin with a space character are not saved in the history list.
#       A value of ignoredups causes lines matching the previous history entry
#       to not be saved. A value of ignoreboth is shorthand for ignorespace
#       and ignoredups. A value of erasedups causes all previous lines
#       matching the current line to be removed from the history list before
#       that line is saved. Any value not in the above list is ignored. If
#       HISTCONTROL is unset, or does not include a valid value, all lines
#       read by the shell parser are saved on the history list, subject to the
#       value of HISTIGNORE. The second and subsequent lines of a multi-line
#       compound command are not tested, and are added to the history
#       regardless of the value of HISTCONTROL.
#
HISTCONTROL="ignorespace:erasedups"
# HISTSIZE
#       The number of commands to remember in the command history (see HISTORY
#       below). The default value is 500.
#
HISTSIZE=500000
# HISTFILESIZE
#       The maximum number of lines contained in the history file. When this
#       variable is assigned a value, the history file is truncated, if
#       necessary, by removing the oldest entries, to contain no more than that
#       number of lines. The default value is 500. The history file is also
#       truncated to this size after writing it when an interactive shell exits.
HISTFILESIZE=100000
# HISTIGNORE
#       A colon-separated list of patterns used to decide which command lines
#       should be saved on the history list. Each pattern is anchored at the
#       beginning of the line and must match the complete line (no implicit
#       `*' is appended). Each pattern is tested against the line after the
#       checks specified by HISTCONTROL are applied. In addition to the normal
#       shell pattern matching characters, `&' matches the previous history
#       line. `&' may be escaped using a backslash; the backslash is removed
#       before attempting a match. The second and subsequent lines of a
#       multi-line compound command are not tested, and are added to the
#       history regardless of the value of HISTIGNORE.
HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
# HISTTIMEFORMAT
#       If this variable is set and not null, its value is used as a format
#       string for strftime(3) to print the time stamp associated with each
#       history entry displayed by the history builtin.  If this variable is
#       set, time stamps are written to the history file so they may be
#       preserved across shell sessions.
HISTTIMEFORMAT='%F %T '

# Record each line as it gets issued
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

## Environment:

## Utility functions used to include other configuration files:

try_to_source() {
    local file="${1}"

    [[ -f "${file}" && -r "${file}" ]] && . "${file}"
}

source_everything_in() {
    local dir="${1}"

    if [[ -d "${dir}" && -r "${dir}" && -x "${dir}" ]]; then
        for file in "${dir}"/*; do
           try_to_source "${file}"
        done
    fi
}

has() {
    hash "$@" &>/dev/null
}

# Include individual bash configuration files.
source_everything_in ~/.bashrc.d

# Include host-specific .bashrc file.
# This is done last to allow for host-specific overrides of defaults.
try_to_source ~/".bashrc.$(hostname -s)"

# Allow direnv to override the environment
has direnv && eval "$(direnv hook bash)"
