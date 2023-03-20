export def main [] {
    # extra desired values for the azu theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#09111a"
    # foreground: "#d9e6f2"
    # cursor: "#d9e6f2"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#bcd6b8"
        empty: "#6d74ac"
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
        row_index: "#bcd6b8"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#262626"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d3b8d6"
        shape_bool: "#b8d6d3"
        shape_int: "#d3b8d6"
        shape_float: "#d3b8d6"
        shape_range: "#d6d3b8"
        shape_internalcall: "#b8d6d3"
        shape_external: "#6daca4"
        shape_externalarg: "#bcd6b8"
        shape_literal: "#6d74ac"
        shape_operator: "#aca46d"
        shape_signature: "#bcd6b8"
        shape_string: "#74ac6d"
        shape_string_interpolation: "#b8d6d3"
        shape_datetime: "#b8d6d3"
        shape_list: "#b8d6d3"
        shape_table: "#b8bcd6"
        shape_record: "#b8d6d3"
        shape_block: "#b8bcd6"
        shape_filepath: "#6daca4"
        shape_globpattern: "#b8d6d3"
        shape_variable: "#a46dac"
        shape_flag: "#b8bcd6"
        shape_custom: "#74ac6d"
        shape_nothing: "#b8d6d3"
    }
}
