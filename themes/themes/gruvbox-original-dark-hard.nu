export def main [] {
    # extra desired values for the gruvbox_original-dark-hard theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1d2021"
    # foreground: "#ebdbb2"
    # cursor: "#ebdbb2"

    {
        # color for nushell primitives
        separator: "#ebdbb2"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b8bb26"
        empty: "#83a598"
        bool: "#ebdbb2"
        int: "#ebdbb2"
        filesize: "#ebdbb2"
        duration: "#ebdbb2"
        date: "#ebdbb2"
        range: "#ebdbb2"
        float: "#ebdbb2"
        string: "#ebdbb2"
        nothing: "#ebdbb2"
        binary: "#ebdbb2"
        cellpath: "#ebdbb2"
        row_index: "#b8bb26"
        record: "#ebdbb2"
        list: "#ebdbb2"
        block: "#ebdbb2"
        hints: "#1d2021"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d3869b"
        shape_bool: "#8ec07c"
        shape_int: "#d3869b"
        shape_float: "#d3869b"
        shape_range: "#fabd2f"
        shape_internalcall: "#8ec07c"
        shape_external: "#8ec07c"
        shape_externalarg: "#b8bb26"
        shape_literal: "#83a598"
        shape_operator: "#fabd2f"
        shape_signature: "#b8bb26"
        shape_string: "#b8bb26"
        shape_string_interpolation: "#8ec07c"
        shape_datetime: "#8ec07c"
        shape_list: "#8ec07c"
        shape_table: "#83a598"
        shape_record: "#8ec07c"
        shape_block: "#83a598"
        shape_filepath: "#8ec07c"
        shape_globpattern: "#8ec07c"
        shape_variable: "#d3869b"
        shape_flag: "#83a598"
        shape_custom: "#b8bb26"
        shape_nothing: "#8ec07c"
    }
}
