# Colors!

readonly colors=(   \
    black           \
    red             \
    green           \
    yellow          \
    blue            \
    magenta         \
    cyan            \
    white           \
    bright_black    \
    bright_red      \
    bright_green    \
    bright_yellow   \
    bright_blue     \
    bright_magenta  \
    bright_cyan     \
    bright_white    \
)

init_color_vars() {
    local color_index
    for color_index in ${!colors[@]}; do
        local color="${colors[$color_index]}"
        readonly "ansi_fg_${color}"="$(tput setaf ${color_index})"
        readonly "ansi_bg_${color}"="$(tput setab ${color_index})"
    done
    readonly ansi_reset="$(tput sgr0)"
    unset init_color_vars # self-destruct to avoid polluting the namespace
}
init_color_vars

# base16 mappings
# See https://github.com/vbwx/base16-terminal-app/blob/master/templates/default.mustache

init_base16() {
    local mode
    for mode in fg bg; do
        local color_index
        for color_index in ${!colors[@]}; do
            local color="${colors[$color_index]}"
            local "${color}_var"="ansi_${mode}_${color}"
        done

        # base00 - Default Background
        readonly "base00_${mode}"=${!black_var}
        # base01 - Lighter Background (Used for status bars)
        readonly "base01_${mode}"=${!bright_green_var}
        # base02 - Selection Background
        readonly "base02_${mode}"=${!bright_yellow_var}
        # base03 - Comments, Invisibles, Line Highlighting
        readonly "base03_${mode}"=${!bright_black_var}
        # base04 - Dark Foreground (Used for status bars)
        readonly "base04_${mode}"=${!bright_blue_var}
        # base05 - Default Foreground, Caret, Delimiters, Operators
        readonly "base05_${mode}"=${!white_var}
        # base06 - Light Foreground (Not often used)
        readonly "base06_${mode}"=${!bright_magenta_var}
        # base07 - Light Background (Not often used)
        readonly "base07_${mode}"=${!bright_white_var}
        # base08 - Variables, XML Tags, Markup Link Text, Markup Lists,
        #          Diff Deleted
        readonly "base08_${mode}"=${!red_var}
        # base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
        readonly "base09_${mode}"=${!bright_red_var}
        # base0A - Classes, Markup Bold, Search Text Background
        readonly "base0A_${mode}"=${!yellow_var}
        # base0B - Strings, Inherited Class, Markup Code, Diff Inserted
        readonly "base0B_${mode}"=${!green_var}
        # base0C - Support, Regular Expressions, Escape Characters,
        #          Markup Quotes
        readonly "base0C_${mode}"=${!cyan_var}
        # base0D - Functions, Methods, Attribute IDs, Headings
        readonly "base0D_${mode}"=${!blue_var}
        # base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
        readonly "base0E_${mode}"=${!magenta_var}
        # base0F - Deprecated, Opening/Closing Embedded Language Tags
        #          e.g. <?php ?>
        readonly "base0F_${mode}"=${!bright_cyan_var}
    done

    # Semantic variables
    readonly base16_bg_default="${base00_bg}"
    readonly base16_bg_status_bar="${base01_bg}"
    readonly base16_bg_selection="${base02_bg}"
    readonly base16_bg_line_highlight="${base03_bg}"
    readonly base16_bg_light="${base07_bg}"
    readonly base16_bg_search="${base0A_bg}"

    readonly base16_comment="${base03_fg}"
    readonly base16_invisibles="${base03_fg}"
    readonly base16_status_bar="${base04_fg}"
    readonly base16_default="${base05_fg}"
    readonly base16_caret="${base05_fg}"
    readonly base16_delimiters="${base05_fg}"
    readonly base16_operators="${base05_fg}"
    readonly base16_light="${base06_fg}"
    readonly base16_var="${base08_fg}"
    readonly base16_tag="${base08_fg}"
    readonly base16_link_text="${base08_fg}"
    readonly base16_list="${base08_fg}"
    readonly base16_diff_del="${base08_fg}"
    readonly base16_int="${base09_fg}"
    readonly base16_bool="${base09_fg}"
    readonly base16_const="${base09_fg}"
    readonly base16_attr="${base09_fg}"
    readonly base16_link_url="${base09_fg}"
    readonly base16_class="${base0A_fg}"
    readonly base16_bold="${base0A_fg}"
    readonly base16_string="${base0B_fg}"
    readonly base16_inherit="${base0B_fg}"
    readonly base16_code="${base0B_fg}"
    readonly base16_diff_ins="${base0B_fg}"
    readonly base16_support="${base0C_fg}"
    readonly base16_regex="${base0C_fg}"
    readonly base16_esc="${base0C_fg}"
    readonly base16_quote="${base0C_fg}"
    readonly base16_function="${base0D_fg}"
    readonly base16_method="${base0D_fg}"
    readonly base16_attr_id="${base0D_fg}"
    readonly base16_heading="${base0D_fg}"
    readonly base16_keyword="${base0E_fg}"
    readonly base16_storage="${base0E_fg}"
    readonly base16_selector="${base0E_fg}"
    readonly base16_italic="${base0E_fg}"
    readonly base16_diff_change="${base0E_fg}"
    readonly base16_deprecated="${base0F_fg}"
    readonly base16_lang_tag="${base0F_fg}"

    unset init_base16 # self-destruct to avoid polluting the namespace
}
init_base16

ansi_text() {
    local color="${1}"; shift
    echo -n "${color}${@}${ansi_reset}"
}

_prompt_escape() {
    echo -n "\[${@}\]"
}

_prompt_color() {
    local color="${1}"; shift
    _prompt_escape "${color}"
    echo -n "${@}"
    _prompt_escape "${ansi_reset}"
}

show_colors() {
    local color_index
    for color_index in ${!colors[@]}; do
        local color="${colors[${color_index}]}"
        local fg="ansi_fg_${color}"
        local bg="ansi_bg_${color}"
        printf "$(ansi_text ${!fg} ' %15s ')" "${color}"
        printf "$(ansi_text ${!bg} ' %15s ')" "${color}"
        local mode
        # 'dim' mode doesn't appear to do anything in Terminal.app
        # 'rev' and 'smso' appear identical
        for mode in bold smul smso; do
            local ansi_mode="$(tput ${mode})"
            printf "${ansi_mode}$(ansi_text ${!fg} ' %15s:%s ')" \
                   "${color}" \
                   "${mode}"
            printf "${ansi_mode}$(ansi_text ${!bg} ' %15s:%s ')" \
                   "${color}" \
                   "${mode}"
        done
        echo
    done
}

show_base16() {
    local index
    for index in {0..15}; do
        local base="$(printf 'base%02X' $index)"
        local fg="${base}_fg"
        local bg="${base}_bg"
        ansi_text ${!fg} " ${base} "
        ansi_text ${!bg} " ${base} "
        echo
    done
}

# Enable colors in various command-line tools
export GREP_COLOR="1;32"
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1

# Try to determine whether the 'ls' command on
# this system supports the "--color" option
if $(ls --color >/dev/null 2>&1); then
    alias ls='ls --color=auto';
else
    # Set colors for BSD ls (macOS)
    # From ls(1):
    #
    #     This string is a concatenation of pairs of the format fb,
    #     where f is the foreground color and b is the background color.
    #     The color designators are as follows:
    #           a     black
    #           b     red
    #           c     green
    #           d     brown
    #           e     blue
    #           f     magenta
    #           g     cyan
    #           h     light grey
    #           A     bold black, usually shows up as dark grey
    #           B     bold red
    #           C     bold green
    #           D     bold brown, usually shows up as yellow
    #           E     bold blue
    #           F     bold magenta
    #           G     bold cyan
    #           H     bold light grey; looks like bright white
    #           x     default foreground or background
    #     Note that the above are standard ANSI colors.  The actual display may
    #     differ depending on the color capabilities of the terminal in use.
    #     The order of the attributes are as follows:
    #           1.   directory
    #           2.   symbolic link
    #           3.   socket
    #           4.   pipe
    #           5.   executable
    #           6.   block special
    #           7.   character special
    #           8.   executable with setuid bit set
    #           9.   executable with setgid bit set
    #           10.  directory writable to others, with sticky bit
    #           11.  directory writable to others, without sticky bit
    #     The default is "exfxcxdxbxegedabagacad", i.e. blue foreground and
    #     default background for regular directories, black foreground and red
    #     background for setuid executables, etc.
    #
    # This is changed from the default as follows:
    #   1. block special: from blue on cyan to black on blue
    #   2. character special: blue on brown to black on green
    #   3. executable with setgid bit set: black on cyan to black on brown
    #   4. directory writable to others, with sticky bit: black on green to
    #      bold cyan
    #   5. directory writable to others, without sticky bit: black on brown to
    #      bold black on cyan
    #
    # Note that "brown" is actually what is normally considered yellow (ANSI 3)
    # and the bold colors do not appear as different hues in the macOS Terminal
    # unless you check "Use bright colors for bold text" (I do not).

    #                                -------- directory: blue
    #                               / ------- symbolic link: magenta
    #                              / / ------ socket: green
    #                             / / / ----- pipe: brown
    #                            / / / / ---- executable: red
    #                           / / / / / --- block special: bold black on blue
    #                          / / / / / / -- character special:
    #                         / / / / / / /   bold black on green
    #                        / / / / / / / -- executable with setuid bit set:
    #                       / / / / / / / /   bold black on red
    #                      / / / / / / / / -- executable with setgid bit set:
    #                     / / / / / / / / /   bold black on brown
    #                    / / / / / / / / / -- directory writable to others,
    #                   / / / / / / / / / /   with sticky bit: bold cyan
    #                  / / / / / / / / / / -- directory writable to others,
    #                 / / / / / / / / / / /   without sticky bit:
    #                / / / / / / / / / / /    bold black on cyan
    #               \/\/\/\/\/\/\/\/\/\/\/
    export LSCOLORS=exfxcxdxbxAeAcAbAdGxAg
fi

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

rgb2hex() {
    perl -e '
        (shift @ARGV) =~
            /rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)/ &&
                printf "#%02X%02X%02X\n", $1, $2, $3
    ' \
    "${@}"
}

hex2rgb() {
    perl -e '
        (shift @ARGV) =~
            /#?([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2})/ &&
                printf "rgb(%d, %d, %d)\n", hex($1), hex($2), hex($3)
    ' \
    "${@}";
}
