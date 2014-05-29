# Quickly starts a webserver from the current directory.
#
# Thanks to:
# @textgoeshere
# https://gist.github.com/willurd/5720255
#
# @param [optional, Integer] bind port number, default 8000
#
serve() {
    ruby -run -ehttpd . -p${1:-8000}
}
