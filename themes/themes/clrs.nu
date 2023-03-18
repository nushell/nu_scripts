export def main [] {
    # extra desired values for the clrs theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ffffff"
    # foreground: "#262626"
    # cursor: "#262626"

    {
        # color for nushell primitives
        separator: "#eeeeec"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#2cc631"
        empty: "#135cd0"
        bool: "#eeeeec"
        int: "#eeeeec"
        filesize: "#eeeeec"
        duration: "#eeeeec"
        date: "#eeeeec"
        range: "#eeeeec"
        float: "#eeeeec"
        string: "#eeeeec"
        nothing: "#eeeeec"
        binary: "#eeeeec"
        cellpath: "#eeeeec"
        row_index: "#2cc631"
        record: "#eeeeec"
        list: "#eeeeec"
        block: "#eeeeec"
        hints: "#555753"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#e900b0"
        shape_bool: "#3ad5ce"
        shape_int: "#e900b0"
        shape_float: "#e900b0"
        shape_range: "#fdd727"
        shape_internalcall: "#3ad5ce"
        shape_external: "#33c3c1"
        shape_externalarg: "#2cc631"
        shape_literal: "#135cd0"
        shape_operator: "#fa701d"
        shape_signature: "#2cc631"
        shape_string: "#328a5d"
        shape_string_interpolation: "#3ad5ce"
        shape_datetime: "#3ad5ce"
        shape_list: "#3ad5ce"
        shape_table: "#1670ff"
        shape_record: "#3ad5ce"
        shape_block: "#1670ff"
        shape_filepath: "#33c3c1"
        shape_globpattern: "#3ad5ce"
        shape_variable: "#9f00bd"
        shape_flag: "#1670ff"
        shape_custom: "#328a5d"
        shape_nothing: "#3ad5ce"
    }
}
