export def main [] {
    # extra desired values for the paraiso theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2f1e2e"
    # foreground: "#a39e9b"
    # cursor: "#a39e9b"

    {
        # color for nushell primitives
        separator: "#e7e9db"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#48b685"
        empty: "#06b6ef"
        bool: "#e7e9db"
        int: "#e7e9db"
        filesize: "#e7e9db"
        duration: "#e7e9db"
        date: "#e7e9db"
        range: "#e7e9db"
        float: "#e7e9db"
        string: "#e7e9db"
        nothing: "#e7e9db"
        binary: "#e7e9db"
        cellpath: "#e7e9db"
        row_index: "#48b685"
        record: "#e7e9db"
        list: "#e7e9db"
        block: "#e7e9db"
        hints: "#776e71"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#815ba4"
        shape_bool: "#5bc4bf"
        shape_int: "#815ba4"
        shape_float: "#815ba4"
        shape_range: "#fec418"
        shape_internalcall: "#5bc4bf"
        shape_external: "#5bc4bf"
        shape_externalarg: "#48b685"
        shape_literal: "#06b6ef"
        shape_operator: "#fec418"
        shape_signature: "#48b685"
        shape_string: "#48b685"
        shape_string_interpolation: "#5bc4bf"
        shape_datetime: "#5bc4bf"
        shape_list: "#5bc4bf"
        shape_table: "#06b6ef"
        shape_record: "#5bc4bf"
        shape_block: "#06b6ef"
        shape_filepath: "#5bc4bf"
        shape_globpattern: "#5bc4bf"
        shape_variable: "#815ba4"
        shape_flag: "#06b6ef"
        shape_custom: "#48b685"
        shape_nothing: "#5bc4bf"
    }
}
