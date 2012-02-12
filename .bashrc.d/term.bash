# Adapted from:
# http://www.entropy.ch/blog/Mac+OS+X/2008/06/27/Terminal-Tricks-%E2%80%9Cterm%E2%80%9D-revisited-with-tabs.html
#
# Open a new Mac OS X terminal tab or window in the current or another
# directory and optionally run a command in the new tab or window.
#
# - Without any arguments, the new terminal tab opens in the current
#   directory, i.e. the executed command is "cd $PWD".
# - If the first argument is a directory, the new terminal will "cd" into
#   that directory before executing the remaining arguments as command.
# - The optional "-w" flag executes the command in a new window instead of a
#   new tab.
# - The optional "-x" flag closes the new tab or window after the executed
#   command finishes.
# - The optional "-p" flag takes an argument of the form x,y (e.g. 40,50) and
#   positions the terminal window to the indicated location on the screen.
# - The optional "-s" flag takes an argument of the form w,h (e.g. 800,400) and
#   resizes the terminal window to the indicated width and height in pixels.
#
# Written by Marc Liyanage <http://www.entropy.ch>
#
# Version 2.2 by Tim Moore <tmoore@incrementalism.net>
# CHANGES:
# - Written as a shell function rather than an executable script.
# - Detects whether osascript exists before defining the function.
# - Opens new tabs by default.  The '-t' switch has been replaced with a '-w'
#   switch to open a new window instead.
#
if [ -n "$(which osascript)" ]; then
	term() {
		local OPTION EXIT TAB=1 POSITION SIZE OPTIND=1 WD COMMAND

		while getopts xwp:s: OPTION; do
			[ $OPTION = "x" ] && { EXIT='; exit'; }
			[ $OPTION = "w" ] && { unset TAB; }
			[ $OPTION = "p" ] && { POSITION="set position of window 1 to {$OPTARG}"; }
			[ $OPTION = "s" ] && { SIZE="set size of window 1 to {$OPTARG}"; }
		done

		for (( $OPTIND; $OPTIND-1; OPTIND=$OPTIND-1 )); do shift; done

		if [[ -d "$1" ]]; then
			WD=$(cd "$1"; pwd)
			shift
		else WD=$PWD
		fi

		COMMAND="cd '$WD' && echo -n \$'\\\\ec'"
		for i in "$@"; do
			COMMAND="$COMMAND; '$i'"
		done

		if [ $TAB ]; then

			osascript >/dev/null <<-EOF
				tell application "System Events"
					tell process "Terminal" to keystroke "t" using command down
				end
				tell application "Terminal"
					activate
					do script with command "$COMMAND $EXIT" in window 1
					$POSITION
					$SIZE
				end tell
			EOF

		else

			osascript <<-EOF
				tell application "Terminal"
					activate
					do script with command "$COMMAND $EXIT"
					$POSITION
					$SIZE
				end tell
			EOF

		fi
	}
fi
