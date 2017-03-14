if has less; then
    export PAGER="$(which less)"
    export LESS="SR"

    # Colorful manpages
    # Inspired by http://github.com/anveo/dotfiles
    # and http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
    # with updates from http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
    #
    # > man and less use:
    # >
    # >   - bold for headings, command synopses, and code font
    # >   - underline for proper names (for example, “termcap” and “terminfo” in the
    # >     termcap manpage), variable names (“name”, “bp”, “id”, etc.), and type
    # >     names in some manpages (such as dispatch_queue_create(3))
    # >   - inverse for the prompt at the bottom

    # mb - 'blinking' text
    # md - 'bold' text
    # us - 'underlined' text
    # ue - end 'underlined' text
    export LESS_TERMCAP_mb="$(tput smso)${ansi_fg_red}"
    export LESS_TERMCAP_md="$(tput bold)${base16_heading}"
    export LESS_TERMCAP_us="$(tput smul)${base16_var}"
    export LESS_TERMCAP_ue="${ansi_reset}"
fi
