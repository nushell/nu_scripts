export def main [] {
    # extra desired values for the espresso_libre theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2a211c"
    # foreground: "#b8a898"
    # cursor: "#b8a898"

    {
        # color for nushell primitives
        separator: "#eeeeec"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#9aff87"
        empty: "#0066ff"
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
        row_index: "#9aff87"
        record: "#eeeeec"
        list: "#eeeeec"
        block: "#eeeeec"
        hints: "#555753"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff818a"
        shape_bool: "#34e2e2"
        shape_int: "#ff818a"
        shape_float: "#ff818a"
        shape_range: "#fffb5c"
        shape_internalcall: "#34e2e2"
        shape_external: "#06989a"
        shape_externalarg: "#9aff87"
        shape_literal: "#0066ff"
        shape_operator: "#f0e53a"
        shape_signature: "#9aff87"
        shape_string: "#1a921c"
        shape_string_interpolation: "#34e2e2"
        shape_datetime: "#34e2e2"
        shape_list: "#34e2e2"
        shape_table: "#43a8ed"
        shape_record: "#34e2e2"
        shape_block: "#43a8ed"
        shape_filepath: "#06989a"
        shape_globpattern: "#34e2e2"
        shape_variable: "#c5656b"
        shape_flag: "#43a8ed"
        shape_custom: "#1a921c"
        shape_nothing: "#34e2e2"
    }
}
