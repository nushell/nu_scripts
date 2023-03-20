export def main [] {
    # extra desired values for the windows_10 theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0c0c0c"
    # foreground: "#cccccc"
    # cursor: "#cccccc"

    {
        # color for nushell primitives
        separator: "#f2f2f2"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#16c60c"
        empty: "#3b78ff"
        bool: "#f2f2f2"
        int: "#f2f2f2"
        filesize: "#f2f2f2"
        duration: "#f2f2f2"
        date: "#f2f2f2"
        range: "#f2f2f2"
        float: "#f2f2f2"
        string: "#f2f2f2"
        nothing: "#f2f2f2"
        binary: "#f2f2f2"
        cellpath: "#f2f2f2"
        row_index: "#16c60c"
        record: "#f2f2f2"
        list: "#f2f2f2"
        block: "#f2f2f2"
        hints: "#767676"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b4009e"
        shape_bool: "#61d6d6"
        shape_int: "#b4009e"
        shape_float: "#b4009e"
        shape_range: "#f9f1a5"
        shape_internalcall: "#61d6d6"
        shape_external: "#61d6d6"
        shape_externalarg: "#16c60c"
        shape_literal: "#3b78ff"
        shape_operator: "#f9f1a5"
        shape_signature: "#16c60c"
        shape_string: "#16c60c"
        shape_string_interpolation: "#61d6d6"
        shape_datetime: "#61d6d6"
        shape_list: "#61d6d6"
        shape_table: "#3b78ff"
        shape_record: "#61d6d6"
        shape_block: "#3b78ff"
        shape_filepath: "#61d6d6"
        shape_globpattern: "#61d6d6"
        shape_variable: "#b4009e"
        shape_flag: "#3b78ff"
        shape_custom: "#16c60c"
        shape_nothing: "#61d6d6"
    }
}
