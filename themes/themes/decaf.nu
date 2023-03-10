export def main [] {
    # extra desired values for the decaf theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2d2d2d"
    # foreground: "#cccccc"
    # cursor: "#cccccc"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#beda78"
        empty: "#90bee1"
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
        row_index: "#beda78"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#777777"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#efb3f7"
        shape_bool: "#bed6ff"
        shape_int: "#efb3f7"
        shape_float: "#efb3f7"
        shape_range: "#ffd67c"
        shape_internalcall: "#bed6ff"
        shape_external: "#bed6ff"
        shape_externalarg: "#beda78"
        shape_literal: "#90bee1"
        shape_operator: "#ffd67c"
        shape_signature: "#beda78"
        shape_string: "#beda78"
        shape_string_interpolation: "#bed6ff"
        shape_datetime: "#bed6ff"
        shape_list: "#bed6ff"
        shape_table: "#90bee1"
        shape_record: "#bed6ff"
        shape_block: "#90bee1"
        shape_filepath: "#bed6ff"
        shape_globpattern: "#bed6ff"
        shape_variable: "#efb3f7"
        shape_flag: "#90bee1"
        shape_custom: "#beda78"
        shape_nothing: "#bed6ff"
    }
}
