export def main [] {
    # extra desired values for the hardcore theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#212121"
    # foreground: "#cdcdcd"
    # cursor: "#cdcdcd"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a6e22e"
        empty: "#66d9ef"
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
        row_index: "#a6e22e"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#4a4a4a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9e6ffe"
        shape_bool: "#708387"
        shape_int: "#9e6ffe"
        shape_float: "#9e6ffe"
        shape_range: "#e6db74"
        shape_internalcall: "#708387"
        shape_external: "#708387"
        shape_externalarg: "#a6e22e"
        shape_literal: "#66d9ef"
        shape_operator: "#e6db74"
        shape_signature: "#a6e22e"
        shape_string: "#a6e22e"
        shape_string_interpolation: "#708387"
        shape_datetime: "#708387"
        shape_list: "#708387"
        shape_table: "#66d9ef"
        shape_record: "#708387"
        shape_block: "#66d9ef"
        shape_filepath: "#708387"
        shape_globpattern: "#708387"
        shape_variable: "#9e6ffe"
        shape_flag: "#66d9ef"
        shape_custom: "#a6e22e"
        shape_nothing: "#708387"
    }
}
