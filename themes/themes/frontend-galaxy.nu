export def main [] {
    # extra desired values for the frontend_galaxy theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1d2837"
    # foreground: "#ffffff"
    # cursor: "#ffffff"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#35bb9a"
        empty: "#589df6"
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
        row_index: "#35bb9a"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#555555"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#e75699"
        shape_bool: "#3979bc"
        shape_int: "#e75699"
        shape_float: "#e75699"
        shape_range: "#ffff55"
        shape_internalcall: "#3979bc"
        shape_external: "#1f9ee7"
        shape_externalarg: "#35bb9a"
        shape_literal: "#589df6"
        shape_operator: "#fef02a"
        shape_signature: "#35bb9a"
        shape_string: "#21b089"
        shape_string_interpolation: "#3979bc"
        shape_datetime: "#3979bc"
        shape_list: "#3979bc"
        shape_table: "#589df6"
        shape_record: "#3979bc"
        shape_block: "#589df6"
        shape_filepath: "#1f9ee7"
        shape_globpattern: "#3979bc"
        shape_variable: "#944d95"
        shape_flag: "#589df6"
        shape_custom: "#21b089"
        shape_nothing: "#3979bc"
    }
}
