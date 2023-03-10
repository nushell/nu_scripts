export def main [] {
    # extra desired values for the windows_nt-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ffffff"
    # foreground: "#808080"
    # cursor: "#808080"

    {
        # color for nushell primitives
        separator: "#000000"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#008000"
        empty: "#000080"
        bool: "#000000"
        int: "#000000"
        filesize: "#000000"
        duration: "#000000"
        date: "#000000"
        range: "#000000"
        float: "#000000"
        string: "#000000"
        nothing: "#000000"
        binary: "#000000"
        cellpath: "#000000"
        row_index: "#008000"
        record: "#000000"
        list: "#000000"
        block: "#000000"
        hints: "#c0c0c0"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#800080"
        shape_bool: "#008080"
        shape_int: "#800080"
        shape_float: "#800080"
        shape_range: "#808000"
        shape_internalcall: "#008080"
        shape_external: "#008080"
        shape_externalarg: "#008000"
        shape_literal: "#000080"
        shape_operator: "#808000"
        shape_signature: "#008000"
        shape_string: "#008000"
        shape_string_interpolation: "#008080"
        shape_datetime: "#008080"
        shape_list: "#008080"
        shape_table: "#000080"
        shape_record: "#008080"
        shape_block: "#000080"
        shape_filepath: "#008080"
        shape_globpattern: "#008080"
        shape_variable: "#800080"
        shape_flag: "#000080"
        shape_custom: "#008000"
        shape_nothing: "#008080"
    }
}
