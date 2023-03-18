export def main [] {
    # extra desired values for the solarized_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#002b36"
    # foreground: "#93a1a1"
    # cursor: "#93a1a1"

    {
        # color for nushell primitives
        separator: "#fdf6e3"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#859900"
        empty: "#268bd2"
        bool: "#fdf6e3"
        int: "#fdf6e3"
        filesize: "#fdf6e3"
        duration: "#fdf6e3"
        date: "#fdf6e3"
        range: "#fdf6e3"
        float: "#fdf6e3"
        string: "#fdf6e3"
        nothing: "#fdf6e3"
        binary: "#fdf6e3"
        cellpath: "#fdf6e3"
        row_index: "#859900"
        record: "#fdf6e3"
        list: "#fdf6e3"
        block: "#fdf6e3"
        hints: "#657b83"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#6c71c4"
        shape_bool: "#2aa198"
        shape_int: "#6c71c4"
        shape_float: "#6c71c4"
        shape_range: "#b58900"
        shape_internalcall: "#2aa198"
        shape_external: "#2aa198"
        shape_externalarg: "#859900"
        shape_literal: "#268bd2"
        shape_operator: "#b58900"
        shape_signature: "#859900"
        shape_string: "#859900"
        shape_string_interpolation: "#2aa198"
        shape_datetime: "#2aa198"
        shape_list: "#2aa198"
        shape_table: "#268bd2"
        shape_record: "#2aa198"
        shape_block: "#268bd2"
        shape_filepath: "#2aa198"
        shape_globpattern: "#2aa198"
        shape_variable: "#6c71c4"
        shape_flag: "#268bd2"
        shape_custom: "#859900"
        shape_nothing: "#2aa198"
    }
}
