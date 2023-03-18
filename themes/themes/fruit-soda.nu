export def main [] {
    # extra desired values for the fruit_soda theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f1ecf1"
    # foreground: "#515151"
    # cursor: "#515151"

    {
        # color for nushell primitives
        separator: "#2d2c2c"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#47f74c"
        empty: "#2931df"
        bool: "#2d2c2c"
        int: "#2d2c2c"
        filesize: "#2d2c2c"
        duration: "#2d2c2c"
        date: "#2d2c2c"
        range: "#2d2c2c"
        float: "#2d2c2c"
        string: "#2d2c2c"
        nothing: "#2d2c2c"
        binary: "#2d2c2c"
        cellpath: "#2d2c2c"
        row_index: "#47f74c"
        record: "#2d2c2c"
        list: "#2d2c2c"
        block: "#2d2c2c"
        hints: "#b5b4b6"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#611fce"
        shape_bool: "#0f9cfd"
        shape_int: "#611fce"
        shape_float: "#611fce"
        shape_range: "#f7e203"
        shape_internalcall: "#0f9cfd"
        shape_external: "#0f9cfd"
        shape_externalarg: "#47f74c"
        shape_literal: "#2931df"
        shape_operator: "#f7e203"
        shape_signature: "#47f74c"
        shape_string: "#47f74c"
        shape_string_interpolation: "#0f9cfd"
        shape_datetime: "#0f9cfd"
        shape_list: "#0f9cfd"
        shape_table: "#2931df"
        shape_record: "#0f9cfd"
        shape_block: "#2931df"
        shape_filepath: "#0f9cfd"
        shape_globpattern: "#0f9cfd"
        shape_variable: "#611fce"
        shape_flag: "#2931df"
        shape_custom: "#47f74c"
        shape_nothing: "#0f9cfd"
    }
}
