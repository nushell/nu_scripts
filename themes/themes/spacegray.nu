export def main [] {
    # extra desired values for the spacegray theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#20242d"
    # foreground: "#b3b8c3"
    # cursor: "#b3b8c3"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#87b379"
        empty: "#7d8fa4"
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
        row_index: "#87b379"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#000000"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a47996"
        shape_bool: "#85a7a5"
        shape_int: "#a47996"
        shape_float: "#a47996"
        shape_range: "#e5c179"
        shape_internalcall: "#85a7a5"
        shape_external: "#85a7a5"
        shape_externalarg: "#87b379"
        shape_literal: "#7d8fa4"
        shape_operator: "#e5c179"
        shape_signature: "#87b379"
        shape_string: "#87b379"
        shape_string_interpolation: "#85a7a5"
        shape_datetime: "#85a7a5"
        shape_list: "#85a7a5"
        shape_table: "#7d8fa4"
        shape_record: "#85a7a5"
        shape_block: "#7d8fa4"
        shape_filepath: "#85a7a5"
        shape_globpattern: "#85a7a5"
        shape_variable: "#a47996"
        shape_flag: "#7d8fa4"
        shape_custom: "#87b379"
        shape_nothing: "#85a7a5"
    }
}
