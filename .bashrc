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
