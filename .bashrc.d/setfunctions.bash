# Simple set operations
# inspired by http://www.quora.com/What-are-the-most-useful-swiss-army-knife-one-liners-on-Unix/answer/Joshua-Levy
set-union() {
    cat "$1" "$2" | sort | uniq
}

set-intersection() {
    cat "$1" "$2" | sort | uniq -d
}

set-difference() {
    cat "$1" "$2" "$2" | sort | uniq -u
}
