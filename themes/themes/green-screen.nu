export def main [] {
    # extra desired values for the green_screen theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#001100"
    # foreground: "#00bb00"
    # cursor: "#00bb00"

    {
        # color for nushell primitives
        separator: "#00ff00"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#00bb00"
        empty: "#009900"
        bool: "#00ff00"
        int: "#00ff00"
        filesize: "#00ff00"
        duration: "#00ff00"
        date: "#00ff00"
        range: "#00ff00"
        float: "#00ff00"
        string: "#00ff00"
        nothing: "#00ff00"
        binary: "#00ff00"
        cellpath: "#00ff00"
        row_index: "#00bb00"
        record: "#00ff00"
        list: "#00ff00"
        block: "#00ff00"
        hints: "#007700"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#00bb00"
        shape_bool: "#005500"
        shape_int: "#00bb00"
        shape_float: "#00bb00"
        shape_range: "#007700"
        shape_internalcall: "#005500"
        shape_external: "#005500"
        shape_externalarg: "#00bb00"
        shape_literal: "#009900"
        shape_operator: "#007700"
        shape_signature: "#00bb00"
        shape_string: "#00bb00"
        shape_string_interpolation: "#005500"
        shape_datetime: "#005500"
        shape_list: "#005500"
        shape_table: "#009900"
        shape_record: "#005500"
        shape_block: "#009900"
        shape_filepath: "#005500"
        shape_globpattern: "#005500"
        shape_variable: "#00bb00"
        shape_flag: "#009900"
        shape_custom: "#00bb00"
        shape_nothing: "#005500"
    }
}
