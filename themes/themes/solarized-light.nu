export def main [] {
    # extra desired values for the solarized_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#fdf6e3"
    # foreground: "#586e75"
    # cursor: "#586e75"

    {
        # color for nushell primitives
        separator: "#002b36"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#859900"
        empty: "#268bd2"
        bool: "#002b36"
        int: "#002b36"
        filesize: "#002b36"
        duration: "#002b36"
        date: "#002b36"
        range: "#002b36"
        float: "#002b36"
        string: "#002b36"
        nothing: "#002b36"
        binary: "#002b36"
        cellpath: "#002b36"
        row_index: "#859900"
        record: "#002b36"
        list: "#002b36"
        block: "#002b36"
        hints: "#839496"

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
