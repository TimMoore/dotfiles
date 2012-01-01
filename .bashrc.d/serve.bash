# Quickly starts a webserver from the current directory.
#
# Thanks to:
# https://github.com/fnichol/bashrc/blob/master/bashrc
# http://superuser.com/questions/52483/terminal-tips-and-tricks-for-mac-os-x
#
# @param [optional, Integer] bind port number, default 8000
#
serve() {
    python -m SimpleHTTPServer ${1:-8000}
}
