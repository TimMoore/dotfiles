# If set, an argument to the cd builtin command that is not a directory is
# assumed to be the name of a variable whose value is the directory to change
# to.
#
shopt -u cdable_vars

# If set, minor errors in the spelling of a directory component in a cd
# command will be corrected. The errors checked for are transposed characters,
# a missing character, and one character too many. If a correction is found,
# the corrected file name is printed, and the command proceeds. This option is
# only used by interactive shells.
#
shopt -u cdspell

# If set, bash checks that a command found in the hash table exists before
# trying to execute it. If a hashed command no longer exists, a normal path
# search is performed.
#
shopt -u checkhash

# If set, bash checks the window size after each command and, if necessary,
# updates the values of LINES and COLUMNS.
#
shopt -s checkwinsize

# If set, bash attempts to save all lines of a multiple-line command in the
# same history entry. This allows easy re-editing of multi-line commands.
#
shopt -s cmdhist

# If set, bash changes its behavior to that of version 3.1 with respect to
# quoted arguments to the conditional command's =~ operator.
#
shopt -u compat31

# If set, bash includes filenames beginning with a '.' in the results of
# pathname expansion.
#
shopt -u dotglob

# If set, a non-interactive shell will not exit if it cannot execute the file
# specified as an argument to the exec builtin command. An interactive shell
# does not exit if exec fails.
#
shopt -u execfail

# If set, aliases are expanded as described in bash(1) under ALIASES. This
# option is enabled by default for interactive shells.
#
shopt -s expand_aliases

# If set, behavior intended for use by debuggers is enabled:
# 1.     The -F option to the declare builtin displays the source file name
#        and line number corresponding to each function name supplied as an
#        argument.
# 2.     If the command run by the DEBUG trap returns a non-zero value, the
#        next command is skipped and not executed.
# 3.     If the command run by the DEBUG trap returns a value of 2, and the
#        shell is executing in a subroutine (a shell function or a shell
#        script executed by the . or source builtins), a call to return is
#        simulated.
# 4.     BASH_ARGC and BASH_ARGV are updated as described in their
#        descriptions in bash(1).
# 5.     Function tracing is enabled: command substitution, shell functions,
#        and subshells invoked with ( command ) inherit the DEBUG and RETURN
#        traps.
# 6.     Error tracing is enabled: command substitution, shell functions, and
#        subshells invoked with ( command ) inherit the ERROR trap.
#
shopt -u extdebug

# If set, the extended pattern matching features described in bash(1) under
# Pathname Expansion are enabled.
#
shopt -s extglob

# If set, $'string' and $"string" quoting is performed within ${parameter}
# expansions enclosed in double quotes. This option is enabled by default.
#
shopt -s extquote

# If set, patterns which fail to match filenames during pathname expansion
# result in an expansion error.
#
shopt -u failglob

# If set, the suffixes specified by the FIGNORE shell variable cause words to
# be ignored when performing word completion even if the ignored words are the
# only possible completions. See SHELL VARIABLES in bash(1) for a description
# of FIGNORE. This option is enabled by default.
#
shopt -s force_fignore

# If set, shell error messages are written in the standard GNU error message
# format.
#
shopt -u gnu_errfmt

# If set, the history list is appended to the file named by the value of the
# HISTFILE variable when the shell exits, rather than overwriting the file.
#
shopt -s histappend

# If set, and readline is being used, a user is given the opportunity to
# re-edit a failed history substitution.
#
shopt -u histreedit

# If set, and readline is being used, the results of history substitution are
# not immediately passed to the shell parser. Instead, the resulting line is
# loaded into the readline editing buffer, allowing further modification.
#
shopt -s histverify

# If set, and readline is being used, bash will attempt to perform hostname
# completion when a word containing a @ is being completed (see Completing
# under READLINE in bash(1)). This is enabled by default.
#
shopt -s hostcomplete

# If set, bash will send SIGHUP to all jobs when an interactive login shell
# exits.
#
shopt -u huponexit

# If set, allow a word beginning with # to cause that word and all remaining
# characters on that line to be ignored in an interactive shell (see COMMENTS
# in bash(1)). This option is enabled by default.
#
shopt -s interactive_comments

# If set, and the cmdhist option is enabled, multi-line commands are saved to
# the history with embedded newlines rather than using semicolon separators
# where possible.
#
shopt -u lithist

# If set, and a file that bash is checking for mail has been accessed since
# the last time it was checked, the message "The mail in mailfile has been
# read" is displayed.
#
shopt -u mailwarn

# If set, and readline is being used, bash will not attempt to search the PATH
# for possible completions when completion is attempted on an empty line.
#
shopt -s no_empty_cmd_completion

# If set, bash matches filenames in a case-insensitive fashion when performing
# pathname expansion (see Pathname Expansion in bash(1)).
#
shopt -u nocaseglob

# If set, bash matches patterns in a case-insensitive fashion when performing
# matching while executing case or [[ conditional commands.
#
shopt -u nocasematch

# If set, bash allows patterns which match no files (see Pathname Expansion in
# bash(1)) to expand to a null string, rather than themselves.
#
shopt -u nullglob

# If set, the programmable completion facilities (see Programmable Completion
# inn bash(1)) are enabled. This option is enabled by default.
#
shopt -s progcomp

# If set, prompt strings undergo parameter expansion, command substitution,
# arithmetic expansion, and quote removal after being expanded as described in
# PROMPTING in bash(1). This option is enabled by default.
#
shopt -s promptvars

# If set, the shift builtin prints an error message when the shift count
# exceeds the number of positional parameters.
#
shopt -u shift_verbose

# If set, the source (.) builtin uses the value of PATH to find the directory
# containing the file supplied as an argument. This option is enabled by
# default.
#
shopt -s sourcepath

# If set, the echo builtin expands backslash-escape sequences by default.
#
shopt -u xpg_echo
