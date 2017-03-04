# set [--abefhkmnptuvxBCHP] [-o option] [arg ...]
#        Without  options,  the  name and value of each shell variable are dis-
#        played in a format that can be reused as input for setting  or  reset-
#        ting  the  currently-set  variables.   Read-only  variables  cannot be
#        reset.  In posix mode, only shell variables are listed.  The output is
#        sorted  according  to the current locale.  When options are specified,
#        they set or unset shell attributes.  Any arguments remaining after the
#        options are processed are treated as values for the positional parame-
#        ters and are assigned, in order, to $1,  $2,  ...   $n.   Options,  if
#        specified, have the following meanings:
#        -a      Automatically  mark variables and functions which are modified
#                or created for export to the environment  of  subsequent  com-
#                mands.
#        -b      Report  the  status of terminated background jobs immediately,
#                rather than before the next primary prompt.  This is effective
#                only when job control is enabled.
#        -e      Exit immediately if a simple command (see SHELL GRAMMAR above)
#                exits with a non-zero status.  The shell does not exit if  the
#                command  that  fails  is  part of the command list immediately
#                following a while or until keyword, part of the test in an  if
#                statement, part of a && or || list, or if the command's return
#                value is being inverted via !.  A trap on ERR, if set, is exe-
#                cuted before the shell exits.
#        -f      Disable pathname expansion.
#        -h      Remember  the  location  of commands as they are looked up for
#                execution.  This is enabled by default.
#        -k      All arguments in the form of assignment statements are  placed
#                in  the environment for a command, not just those that precede
#                the command name.
#        -m      Monitor mode.  Job control is enabled.  This option is  on  by
#                default for interactive shells on systems that support it (see
#                JOB CONTROL above).  Background processes run  in  a  separate
#                process  group  and  a  line  containing  their exit status is
#                printed upon their completion.
#        -n      Read commands but do not execute them.  This may  be  used  to
#                check  a  shell  script for syntax errors.  This is ignored by
#                interactive shells.
#        -o option-name
#                The option-name can be one of the following:
#                allexport
#                        Same as -a.
#                braceexpand
#                        Same as -B.
#                emacs   Use an emacs-style  command  line  editing  interface.
#                        This  is enabled by default when the shell is interac-
#                        tive, unless the shell is started with the --noediting
#                        option.
#                errtrace
#                        Same as -E.
#                functrace
#                        Same as -T.
#                errexit Same as -e.
#                hashall Same as -h.
#                histexpand
#                        Same as -H.
#                history Enable  command history, as described above under HIS-
#                        TORY.  This option is on  by  default  in  interactive
#                        shells.
#                ignoreeof
#                        The effect is as if the shell command ``IGNOREEOF=10''
#                        had been executed (see Shell Variables above).
#                keyword Same as -k.
#                monitor Same as -m.
#                noclobber
#                        Same as -C.

set -o noclobber

#                noexec  Same as -n.
#                noglob  Same as -f.  nolog Currently ignored.
#                notify  Same as -b.
#                nounset Same as -u.
#                onecmd  Same as -t.
#                physical
#                        Same as -P.
#                pipefail
#                        If set, the return value of a pipeline is the value of
#                        the  last  (rightmost) command to exit with a non-zero
#                        status, or zero if all commands in the  pipeline  exit
#                        successfully.  This option is disabled by default.
#                posix   Change  the  behavior of bash where the default opera-
#                        tion differs from the  POSIX  standard  to  match  the
#                        standard (posix mode).
#                privileged
#                        Same as -p.
#                verbose Same as -v.
#                vi      Use a vi-style command line editing interface.
#                xtrace  Same as -x.
#                If  -o is supplied with no option-name, the values of the cur-
#                rent  options  are  printed.   If  +o  is  supplied  with   no
#                option-name,  a series of set commands to recreate the current
#                option settings is displayed on the standard output.
#        -p      Turn on privileged mode.  In this mode, the $ENV and $BASH_ENV
#                files  are  not  processed,  shell functions are not inherited
#                from the  environment,  and  the  SHELLOPTS  variable,  if  it
#                appears  in  the  environment,  is  ignored.   If the shell is
#                started with the effective user (group) id not  equal  to  the
#                real user (group) id, and the -p option is not supplied, these
#                actions are taken and the effective user id is set to the real
#                user  id.  If the -p option is supplied at startup, the effec-
#                tive user id is not reset.  Turning this option off causes the
#                effective  user  and  group ids to be set to the real user and
#                group ids.
#        -t      Exit after reading and executing one command.
#        -u      Treat unset variables as an error  when  performing  parameter
#                expansion.   If  expansion  is attempted on an unset variable,
#                the shell prints an error message, and,  if  not  interactive,
#                exits with a non-zero status.
#        -v      Print shell input lines as they are read.
#        -x      After  expanding  each  simple command, for command, case com-
#                mand, select command, or arithmetic for command,  display  the
#                expanded  value  of  PS4,  followed  by  the  command  and its
#                expanded arguments or associated word list.
#        -B      The  shell  performs  brace  expansion  (see  Brace  Expansion
#                above).  This is on by default.
#        -C      If  set,  bash does not overwrite an existing file with the >,
#                >&, and <> redirection operators.  This may be overridden when
#                creating  output  files  by  using the redirection operator >|
#                instead of >.
#        -E      If set, any trap on ERR is inherited by shell functions,  com-
#                mand  substitutions, and commands executed in a subshell envi-
#                ronment.  The ERR trap  is  normally  not  inherited  in  such
#                cases.
#        -H      Enable  !   style  history substitution.  This option is on by
#                default when the shell is interactive.
#        -P      If set, the shell does not follow symbolic links when  execut-
#                ing commands such as cd that change the current working direc-
#                tory.  It uses the physical directory structure  instead.   By
#                default,  bash  follows  the logical chain of directories when
#                performing commands which change the current directory.
#        -T      If set, any traps on DEBUG and RETURN are inherited  by  shell
#                functions,  command  substitutions, and commands executed in a
#                subshell environment.  The DEBUG and RETURN traps are normally
#                not inherited in such cases.
#        --      If no arguments follow this option, then the positional param-
#                eters are unset.  Otherwise, the positional parameters are set
#                to the args, even if some of them begin with a -.
#        -       Signal  the  end  of  options,  cause all remaining args to be
#                assigned to the positional parameters.  The -x and -v  options
#                are  turned off.  If there are no args, the positional parame-
#                ters remain unchanged.
#
#        The options are off by default unless otherwise noted.  Using + rather
#        than - causes these options to be turned off.  The options can also be
#        specified as arguments to an invocation of the shell.  The current set
#        of  options  may  be  found  in  $-.  The return status is always true
#        unless an invalid option is encountered.

# The list of shopt options is:
# cdable_vars
#         If  set,  an argument to the cd builtin command that is not a direc-
#         tory is assumed to be the name of a  variable  whose  value  is  the
#         directory to change to.

shopt -s cdable_vars

# cdspell If  set,  minor errors in the spelling of a directory component in a
#         cd command will be corrected.  The errors checked for are transposed
#         characters,  a  missing character, and one character too many.  If a
#         correction is found, the corrected file name  is  printed,  and  the
#         command proceeds.  This option is only used by interactive shells.

shopt -s cdspell

# checkhash
#         If  set,  bash  checks that a command found in the hash table exists
#         before trying to execute it.  If a hashed command no longer  exists,
#         a normal path search is performed.

shopt -s checkhash

# checkwinsize
#         If  set, bash checks the window size after each command and, if nec-
#         essary, updates the values of LINES and COLUMNS.

shopt -s checkwinsize

# cmdhist If set, bash attempts to save all lines of a  multiple-line  command
#         in  the  same  history entry.  This allows easy re-editing of multi-
#         line commands.

shopt -s cmdhist

# compat31
#         If set, bash changes its  behavior  to  that  of  version  3.1  with
#         respect  to  quoted arguments to the conditional command's =~ opera-
#         tor.

shopt -u compat31

# dotglob If set, bash includes filenames beginning with a `.' in the  results
#         of pathname expansion.

shopt -u dotglob

# execfail
#         If  set,  a non-interactive shell will not exit if it cannot execute
#         the file specified as an argument to the exec builtin  command.   An
#         interactive shell does not exit if exec fails.

shopt -u execfail

# expand_aliases
#         If set, aliases are expanded as described above under ALIASES.  This
#         option is enabled by default for interactive shells.

shopt -s expand_aliases

# extdebug
#         If set, behavior intended for use by debuggers is enabled:
#         1.     The -F option to the declare builtin displays the source file
#                name and line number corresponding to each function name sup-
#                plied as an argument.
#         2.     If the command run by  the  DEBUG  trap  returns  a  non-zero
#                value, the next command is skipped and not executed.
#         3.     If  the  command  run by the DEBUG trap returns a value of 2,
#                and the shell is executing in a subroutine (a shell  function
#                or  a  shell  script executed by the . or source builtins), a
#                call to return is simulated.
#         4.     BASH_ARGC and BASH_ARGV are updated  as  described  in  their
#                descriptions above.
#         5.     Function  tracing  is  enabled:   command substitution, shell
#                functions, and subshells invoked with ( command ) inherit the
#                DEBUG and RETURN traps.
#         6.     Error  tracing is enabled:  command substitution, shell func-
#                tions, and subshells invoked with (  command  )  inherit  the
#                ERROR trap.

shopt -u extdebug

# extglob If set, the extended pattern matching features described above under
#         Pathname Expansion are enabled.

shopt -s extglob

# extquote
#         If set, $'string' and $"string" quoting is performed within ${param-
#         eter}  expansions enclosed in double quotes.  This option is enabled
#         by default.

shopt -s extquote

# failglob
#         If set, patterns which  fail  to  match  filenames  during  pathname
#         expansion result in an expansion error.

shopt -u failglob

# force_fignore
#         If  set,  the suffixes specified by the FIGNORE shell variable cause
#         words to be ignored when performing  word  completion  even  if  the
#         ignored  words  are  the only possible completions.  See SHELL VARI-
#         ABLES above for a description of FIGNORE.  This option is enabled by
#         default.

shopt -s force_fignore

# gnu_errfmt
#         If  set,  shell error messages are written in the standard GNU error
#         message format.

shopt -u gnu_errfmt

# histappend
#         If set, the history list is appended to the file named by the  value
#         of the HISTFILE variable when the shell exits, rather than overwrit-
#         ing the file.

shopt -s histappend

# histreedit
#         If set, and readline is being used, a user is given the  opportunity
#         to re-edit a failed history substitution.

shopt -u histreedit

# histverify
#         If set, and readline is being used, the results of history substitu-
#         tion are not immediately passed to the shell parser.   Instead,  the
#         resulting  line is loaded into the readline editing buffer, allowing
#         further modification.

shopt -s histverify

# hostcomplete
#         If set, and readline is being used, bash  will  attempt  to  perform
#         hostname  completion  when  a word containing a @ is being completed
#         (see Completing under READLINE above).  This is enabled by  default.

shopt -s hostcomplete

# huponexit
#         If  set, bash will send SIGHUP to all jobs when an interactive login
#         shell exits.

shopt -u huponexit

# interactive_comments
#         If set, allow a word beginning with # to cause  that  word  and  all
#         remaining  characters  on  that line to be ignored in an interactive
#         shell (see COMMENTS above).  This option is enabled by default.

shopt -s interactive_comments

# lithist If set, and the cmdhist option is enabled, multi-line  commands  are
#         saved  to the history with embedded newlines rather than using semi-
#         colon separators where possible.

shopt -u lithist

# login_shell
#         The shell sets this option if it is started as a  login  shell  (see
#         INVOCATION above).  The value may not be changed.
# mailwarn
#         If  set, and a file that bash is checking for mail has been accessed
#         since the last time it was checked, the message ``The mail in  mail-
#         file has been read'' is displayed.

shopt -u mailwarn

# no_empty_cmd_completion
#         If  set, and readline is being used, bash will not attempt to search
#         the PATH for possible completions when completion is attempted on an
#         empty line.

shopt -s no_empty_cmd_completion

# nocaseglob
#         If  set,  bash  matches filenames in a case-insensitive fashion when
#         performing pathname expansion (see Pathname Expansion above).

shopt -u nocaseglob

# nocasematch
#         If set, bash matches patterns in  a  case-insensitive  fashion  when
#         performing matching while executing case or [[ conditional commands.

shopt -u nocasematch

# nullglob
#         If set, bash allows patterns which  match  no  files  (see  Pathname
#         Expansion above) to expand to a null string, rather than themselves.

shopt -u nullglob

# progcomp
#         If set, the programmable  completion  facilities  (see  Programmable
#         Completion above) are enabled.  This option is enabled by default.

shopt -s progcomp

# promptvars
#         If  set, prompt strings undergo parameter expansion, command substi-
#         tution, arithmetic expansion, and quote removal after being expanded
#         as described in PROMPTING above.  This option is enabled by default.

shopt -s promptvars

# restricted_shell
#         The shell sets this option if it is started in restricted mode  (see
#         RESTRICTED SHELL below).  The value may not be changed.  This is not
#         reset when the startup files  are  executed,  allowing  the  startup
#         files to discover whether or not a shell is restricted.
# shift_verbose
#         If  set,  the  shift  builtin prints an error message when the shift
#         count exceeds the number of positional parameters.

shopt -u shift_verbose

# sourcepath
#         If set, the source (.) builtin uses the value of PATH  to  find  the
#         directory  containing the file supplied as an argument.  This option
#         is enabled by default.

shopt -s sourcepath

# xpg_echo
#         If set, the  echo  builtin  expands  backslash-escape  sequences  by
#         default.

shopt -u xpg_echo
