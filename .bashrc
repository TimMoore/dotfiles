# The following variables are used by the shell.  In some cases, bash assigns a
# default value to a variable; these cases are noted below.
#
# BASH_ENV
#        If  this  parameter  is set when bash is executing a shell script, its
#        value is interpreted as a filename containing commands  to  initialize
#        the  shell,  as  in  ~/.bashrc.  The value of BASH_ENV is subjected to
#        parameter expansion, command substitution,  and  arithmetic  expansion
#        before  being  interpreted as a file name.  PATH is not used to search
#        for the resultant file name.
# CDPATH The search path for the cd command.  This is a colon-separated list of
#        directories in which the shell looks for destination directories spec-
#        ified by the cd command.  A sample value is ".:~:/usr".

CDPATH=".:~:~/Projects:~/src"

# COLUMNS
#        Used by the select builtin command to  determine  the  terminal  width
#        when  printing  selection  lists.  Automatically set upon receipt of a
#        SIGWINCH.
# COMPREPLY
#        An array variable from which bash reads the possible completions  gen-
#        erated  by  a  shell  function  invoked by the programmable completion
#        facility (see Programmable Completion below).
# EMACS  If bash finds this variable in the environment when the  shell  starts
#        with value "t", it assumes that the shell is running in an emacs shell
#        buffer and disables line editing.
# FCEDIT The default editor for the fc builtin command.
# FIGNORE
#        A colon-separated list of suffixes to ignore when performing  filename
#        completion  (see READLINE below).  A filename whose suffix matches one
#        of the entries in FIGNORE is excluded from the list of  matched  file-
#        names.  A sample value is ".o:~".
# GLOBIGNORE
#        A colon-separated list of patterns defining the set of filenames to be
#        ignored by pathname expansion.  If a filename matched  by  a  pathname
#        expansion  pattern  also matches one of the patterns in GLOBIGNORE, it
#        is removed from the list of matches.
# HISTCONTROL
#        A colon-separated list of values controlling how commands are saved on
#        the  history  list.  If the list of values includes ignorespace, lines
#        which begin with a space character are not saved in the history  list.
#        A value of ignoredups causes lines matching the previous history entry
#        to not be saved.  A value of ignoreboth is shorthand  for  ignorespace
#        and ignoredups.  A value of erasedups causes all previous lines match-
#        ing the current line to be removed from the history list  before  that
#        line  is saved.  Any value not in the above list is ignored.  If HIST-
#        CONTROL is unset, or does not include a valid value, all lines read by
#        the  shell  parser are saved on the history list, subject to the value
#        of HISTIGNORE.  The second and subsequent lines of a  multi-line  com-
#        pound  command are not tested, and are added to the history regardless
#        of the value of HISTCONTROL.

HISTCONTROL="ignorespace:erasedups"

# HISTFILE
#        The name of the file in which command history is  saved  (see  HISTORY
#        below).   The default value is ~/.bash_history.  If unset, the command
#        history is not saved when an interactive shell exits.
# HISTFILESIZE
#        The maximum number of lines contained in the history file.  When  this
#        variable is assigned a value, the history file is truncated, if neces-
#        sary, by removing the oldest entries, to contain  no  more  than  that
#        number  of lines.  The default value is 500.  The history file is also
#        truncated to this size after writing  it  when  an  interactive  shell
#        exits.

HISTFILESIZE=100000

# HISTIGNORE
#        A  colon-separated list of patterns used to decide which command lines
#        should be saved on the history list.  Each pattern is anchored at  the
#        beginning  of  the  line and must match the complete line (no implicit
#        `*' is appended).  Each pattern is tested against the line  after  the
#        checks  specified by HISTCONTROL are applied.  In addition to the nor-
#        mal shell pattern matching characters, `&' matches the  previous  his-
#        tory  line.   `&'  may  be escaped using a backslash; the backslash is
#        removed before attempting a match.  The second and subsequent lines of
#        a  multi-line  compound  command  are not tested, and are added to the
#        history regardless of the value of HISTIGNORE.

HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# HISTSIZE
#        The number of commands to remember in the command history (see HISTORY
#        below).  The default value is 500.

HISTSIZE=500000

# HISTTIMEFORMAT
#        If  this  variable  is set and not null, its value is used as a format
#        string for strftime(3) to print the time stamp  associated  with  each
#        history  entry  displayed by the history builtin.  If this variable is
#        set, time stamps are written to the history file so they may  be  pre-
#        served across shell sessions.
# HOME   The  home  directory of the current user; the default argument for the
#        cd builtin command.  The value of this variable is also used when per-
#        forming tilde expansion.
# HOSTFILE
#        Contains  the  name  of  a  file in the same format as /etc/hosts that
#        should be read when the shell needs to complete a hostname.  The  list
#        of  possible  hostname  completions  may be changed while the shell is
#        running; the next time hostname  completion  is  attempted  after  the
#        value is changed, bash adds the contents of the new file to the exist-
#        ing list.  If HOSTFILE is set, but has no value, bash attempts to read
#        /etc/hosts  to obtain the list of possible hostname completions.  When
#        HOSTFILE is unset, the hostname list is cleared.
# IFS    The Internal Field Separator that is used  for  word  splitting  after
#        expansion and to split lines into words with the read builtin command.
#        The default value is ``<space><tab><newline>''.
# IGNOREEOF
#        Controls the action of an interactive shell on receipt of an EOF char-
#        acter  as the sole input.  If set, the value is the number of consecu-
#        tive EOF characters which must be typed as the first characters on  an
#        input  line  before  bash  exits.  If the variable exists but does not
#        have a numeric value, or has no value, the default value is 10.  If it
#        does not exist, EOF signifies the end of input to the shell.
# INPUTRC
#        The  filename for the readline startup file, overriding the default of
#        ~/.inputrc (see READLINE below).
# LANG   Used to determine the locale category for any  category  not  specifi-
#        cally selected with a variable starting with LC_.
# LC_ALL This  variable  overrides the value of LANG and any other LC_ variable
#        specifying a locale category.
# LC_COLLATE
#        This variable determines the collation order  used  when  sorting  the
#        results  of  pathname  expansion, and determines the behavior of range
#        expressions, equivalence classes, and collating sequences within path-
#        name expansion and pattern matching.
# LC_CTYPE
#        This  variable  determines  the  interpretation  of characters and the
#        behavior of character classes within pathname  expansion  and  pattern
#        matching.
# LC_MESSAGES
#        This  variable  determines  the locale used to translate double-quoted
#        strings preceded by a $.
# LC_NUMERIC
#        This variable determines the locale category used for  number  format-
#        ting.
# LINES  Used  by the select builtin command to determine the column length for
#        printing selection lists.  Automatically set upon receipt  of  a  SIG-
#        WINCH.
# MAIL   If  this  parameter is set to a file name and the MAILPATH variable is
#        not set, bash informs the user of the arrival of mail in the specified
#        file.
# MAILCHECK
#        Specifies how often (in seconds) bash checks for mail.  The default is
#        60 seconds.  When it is time to check for  mail,  the  shell  does  so
#        before  displaying  the primary prompt.  If this variable is unset, or
#        set to a value that is not a number greater than or equal to zero, the
#        shell disables mail checking.
# MAILPATH
#        A colon-separated list of file names to be checked for mail.  The mes-
#        sage to be printed when mail arrives in a particular file may be spec-
#        ified  by  separating the file name from the message with a `?'.  When
#        used in the text of the message, $_ expands to the name of the current
#        mailfile.  Example:
#        MAILPATH='/var/mail/bfox?"You have mail":~/shell-mail?"$_ has mail!"'
#        Bash  supplies  a default value for this variable, but the location of
#        the  user  mail  files  that  it  uses  is  system  dependent   (e.g.,
#        /var/mail/$USER).
# OPTERR If  set  to the value 1, bash displays error messages generated by the
#        getopts builtin command (see SHELL BUILTIN COMMANDS below).  OPTERR is
#        initialized  to  1 each time the shell is invoked or a shell script is
#        executed.
# PATH   The search path for commands.  It is a colon-separated list of  direc-
#        tories  in  which  the shell looks for commands (see COMMAND EXECUTION
#        below).  A zero-length (null) directory name  in  the  value  of  PATH
#        indicates  the current directory.  A null directory name may appear as
#        two adjacent colons, or as an initial or trailing colon.  The  default
#        path is system-dependent, and is set by the administrator who installs
#        bash.             A            common             value             is
#        ``/usr/gnu/bin:/usr/local/bin:/usr/ucb:/bin:/usr/bin''.
# POSIXLY_CORRECT
#        If  this  variable  is  in the environment when bash starts, the shell
#        enters posix mode before reading the startup files, as if the  --posix
#        invocation  option had been supplied.  If it is set while the shell is
#        running, bash enables posix mode, as if the command set -o  posix  had
#        been executed.
# PROMPT_COMMAND
#        If  set, the value is executed as a command prior to issuing each pri-
#        mary prompt.
# PS1    The value of this parameter is expanded (see PROMPTING below) and used
#        as the primary prompt string.  The default value is ``\s-\v\$ ''.
# PS2    The  value  of  this parameter is expanded as with PS1 and used as the
#        secondary prompt string.  The default is ``> ''.
# PS3    The value of this parameter is used as the prompt for the select  com-
#        mand (see SHELL GRAMMAR above).
# PS4    The  value  of this parameter is expanded as with PS1 and the value is
#        printed before each command bash displays during an  execution  trace.
#        The first character of PS4 is replicated multiple times, as necessary,
#        to indicate multiple levels of indirection.  The default is ``+ ''.
# SHELL  The full pathname to the shell is kept in this  environment  variable.
#        If  it  is  not set when the shell starts, bash assigns to it the full
#        pathname of the current user's login shell.
# TIMEFORMAT
#        The value of this parameter is used as a format string specifying  how
#        the  timing  information for pipelines prefixed with the time reserved
#        word should be  displayed.   The  %  character  introduces  an  escape
#        sequence  that  is expanded to a time value or other information.  The
#        escape sequences and their meanings are as follows; the braces  denote
#        optional portions.
#        %%        A literal %.
#        %[p][l]R  The elapsed time in seconds.
#        %[p][l]U  The number of CPU seconds spent in user mode.
#        %[p][l]S  The number of CPU seconds spent in system mode.
#        %P        The CPU percentage, computed as (%U + %S) / %R.
#        The  optional  p  is  a  digit specifying the precision, the number of
#        fractional digits after a decimal point.  A value of 0 causes no deci-
#        mal  point  or  fraction to be output.  At most three places after the
#        decimal point may be specified; values of p greater than 3 are changed
#        to 3.  If p is not specified, the value 3 is used.
#        The  optional  l  specifies a longer format, including minutes, of the
#        form MMmSS.FFs.  The value of p determines whether or not the fraction
#        is included.
#        If  this  variable  is  not  set,  bash  acts  as  if it had the value
#        $'\nreal\t%3lR\nuser\t%3lU\nsys%3lS'.  If the value is null, no timing
#        information is displayed.  A trailing newline is added when the format
#        string is displayed.
# TMOUT  If set to a value greater than zero, TMOUT is treated as  the  default
#        timeout  for the read builtin.  The select command terminates if input
#        does not arrive after TMOUT seconds when input is coming from a termi-
#        nal.   In an interactive shell, the value is interpreted as the number
#        of seconds to wait for input after issuing the primary  prompt.   Bash
#        terminates  after waiting for that number of seconds if input does not
#        arrive.
# TMPDIR If set, Bash uses its value as the name of a directory in  which  Bash
#        creates temporary files for the shell's use.
# auto_resume
#        This  variable  controls how the shell interacts with the user and job
#        control.  If this variable is set, single word simple commands without
#        redirections  are  treated as candidates for resumption of an existing
#        stopped job.  There is no ambiguity allowed; if there is more than one
#        job beginning with the string typed, the job most recently accessed is
#        selected.  The name of a stopped job, in this context, is the  command
#        line used to start it.  If set to the value exact, the string supplied
#        must match the name of a stopped job exactly; if set to substring, the
#        string  supplied  needs  to match a substring of the name of a stopped
#        job.  The substring value provides functionality analogous to  the  %?
#        job  identifier  (see  JOB CONTROL below).  If set to any other value,
#        the supplied string must be a prefix of a  stopped  job's  name;  this
#        provides functionality analogous to the %string job identifier.
# histchars
#        The  two  or three characters which control history expansion and tok-
#        enization (see HISTORY EXPANSION below).  The first character  is  the
#        history  expansion character, the character which signals the start of
#        a history expansion, normally `!'.  The second character is the  quick
#        substitution  character, which is used as shorthand for re-running the
#        previous command entered, substituting one string for another  in  the
#        command.   The  default  is  `^'.  The optional third character is the
#        character which indicates that the remainder of the line is a  comment
#        when  found  as the first character of a word, normally `#'.  The his-
#        tory comment character causes history substitution to be  skipped  for
#        the  remaining  words  on the line.  It does not necessarily cause the
#        shell parser to treat the rest of the line as a comment.

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
# dotglob If set, bash includes filenames beginning with a `.' in the  results
#         of pathname expansion.
# execfail
#         If  set,  a non-interactive shell will not exit if it cannot execute
#         the file specified as an argument to the exec builtin  command.   An
#         interactive shell does not exit if exec fails.
# expand_aliases
#         If set, aliases are expanded as described above under ALIASES.  This
#         option is enabled by default for interactive shells.
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
# extglob If set, the extended pattern matching features described above under
#         Pathname Expansion are enabled.

shopt -s extglob

# extquote
#         If set, $'string' and $"string" quoting is performed within ${param-
#         eter}  expansions enclosed in double quotes.  This option is enabled
#         by default.
# failglob
#         If set, patterns which  fail  to  match  filenames  during  pathname
#         expansion result in an expansion error.
# force_fignore
#         If  set,  the suffixes specified by the FIGNORE shell variable cause
#         words to be ignored when performing  word  completion  even  if  the
#         ignored  words  are  the only possible completions.  See SHELL VARI-
#         ABLES above for a description of FIGNORE.  This option is enabled by
#         default.
# gnu_errfmt
#         If  set,  shell error messages are written in the standard GNU error
#         message format.
# histappend
#         If set, the history list is appended to the file named by the  value
#         of the HISTFILE variable when the shell exits, rather than overwrit-
#         ing the file.
# histreedit
#         If set, and readline is being used, a user is given the  opportunity
#         to re-edit a failed history substitution.
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
# huponexit
#         If  set, bash will send SIGHUP to all jobs when an interactive login
#         shell exits.
# interactive_comments
#         If set, allow a word beginning with # to cause  that  word  and  all
#         remaining  characters  on  that line to be ignored in an interactive
#         shell (see COMMENTS above).  This option is enabled by default.
# lithist If set, and the cmdhist option is enabled, multi-line  commands  are
#         saved  to the history with embedded newlines rather than using semi-
#         colon separators where possible.
# login_shell
#         The shell sets this option if it is started as a  login  shell  (see
#         INVOCATION above).  The value may not be changed.
# mailwarn
#         If  set, and a file that bash is checking for mail has been accessed
#         since the last time it was checked, the message ``The mail in  mail-
#         file has been read'' is displayed.
# no_empty_cmd_completion
#         If  set, and readline is being used, bash will not attempt to search
#         the PATH for possible completions when completion is attempted on an
#         empty line.

shopt -s no_empty_cmd_completion

# nocaseglob
#         If  set,  bash  matches filenames in a case-insensitive fashion when
#         performing pathname expansion (see Pathname Expansion above).
# nocasematch
#         If set, bash matches patterns in  a  case-insensitive  fashion  when
#         performing matching while executing case or [[ conditional commands.
# nullglob
#         If set, bash allows patterns which  match  no  files  (see  Pathname
#         Expansion above) to expand to a null string, rather than themselves.
# progcomp
#         If set, the programmable  completion  facilities  (see  Programmable
#         Completion above) are enabled.  This option is enabled by default.
# promptvars
#         If  set, prompt strings undergo parameter expansion, command substi-
#         tution, arithmetic expansion, and quote removal after being expanded
#         as described in PROMPTING above.  This option is enabled by default.
# restricted_shell
#         The shell sets this option if it is started in restricted mode  (see
#         RESTRICTED SHELL below).  The value may not be changed.  This is not
#         reset when the startup files  are  executed,  allowing  the  startup
#         files to discover whether or not a shell is restricted.
# shift_verbose
#         If  set,  the  shift  builtin prints an error message when the shift
#         count exceeds the number of positional parameters.
# sourcepath
#         If set, the source (.) builtin uses the value of PATH  to  find  the
#         directory  containing the file supplied as an argument.  This option
#         is enabled by default.
# xpg_echo
#         If set, the  echo  builtin  expands  backslash-escape  sequences  by
#         default.

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
