## Variables used by bash:

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
HISTSIZE=10000

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
