export def main [] {
    # extra desired values for the broadcast theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2b2b2b"
    # foreground: "#e6e1dc"
    # cursor: "#e6e1dc"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#83d182"
        empty: "#6d9cbe"
        bool: "#ffffff"
        int: "#ffffff"
        filesize: "#ffffff"
        duration: "#ffffff"
        date: "#ffffff"
        range: "#ffffff"
        float: "#ffffff"
        string: "#ffffff"
        nothing: "#ffffff"
        binary: "#ffffff"
        cellpath: "#ffffff"
        row_index: "#83d182"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#323232"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ffffff"
        shape_bool: "#a0cef0"
        shape_int: "#ffffff"
        shape_float: "#ffffff"
        shape_range: "#ffff7c"
        shape_internalcall: "#a0cef0"
        shape_external: "#6e9cbe"
        shape_externalarg: "#83d182"
        shape_literal: "#6d9cbe"
        shape_operator: "#ffd24a"
        shape_signature: "#83d182"
        shape_string: "#519f50"
        shape_string_interpolation: "#a0cef0"
        shape_datetime: "#a0cef0"
        shape_list: "#a0cef0"
        shape_table: "#9fcef0"
        shape_record: "#a0cef0"
        shape_block: "#9fcef0"
        shape_filepath: "#6e9cbe"
        shape_globpattern: "#a0cef0"
        shape_variable: "#d0d0ff"
        shape_flag: "#9fcef0"
        shape_custom: "#519f50"
        shape_nothing: "#a0cef0"
    }
}
