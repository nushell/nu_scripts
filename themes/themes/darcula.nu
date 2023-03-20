export def main [] {
    # extra desired values for the darcula theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2b2b2b"
    # foreground: "#a9b7c6"
    # cursor: "#a9b7c6"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#6a8759"
        empty: "#9876aa"
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
        row_index: "#6a8759"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#606366"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#cc7832"
        shape_bool: "#629755"
        shape_int: "#cc7832"
        shape_float: "#cc7832"
        shape_range: "#bbb529"
        shape_internalcall: "#629755"
        shape_external: "#629755"
        shape_externalarg: "#6a8759"
        shape_literal: "#9876aa"
        shape_operator: "#bbb529"
        shape_signature: "#6a8759"
        shape_string: "#6a8759"
        shape_string_interpolation: "#629755"
        shape_datetime: "#629755"
        shape_list: "#629755"
        shape_table: "#9876aa"
        shape_record: "#629755"
        shape_block: "#9876aa"
        shape_filepath: "#629755"
        shape_globpattern: "#629755"
        shape_variable: "#cc7832"
        shape_flag: "#9876aa"
        shape_custom: "#6a8759"
        shape_nothing: "#629755"
    }
}
