export def main [] {
    # extra desired values for the gruvbox_dark-soft theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#32302f"
    # foreground: "#d5c4a1"
    # cursor: "#d5c4a1"

    {
        # color for nushell primitives
        separator: "#fbf1c7"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b8bb26"
        empty: "#83a598"
        bool: "#fbf1c7"
        int: "#fbf1c7"
        filesize: "#fbf1c7"
        duration: "#fbf1c7"
        date: "#fbf1c7"
        range: "#fbf1c7"
        float: "#fbf1c7"
        string: "#fbf1c7"
        nothing: "#fbf1c7"
        binary: "#fbf1c7"
        cellpath: "#fbf1c7"
        row_index: "#b8bb26"
        record: "#fbf1c7"
        list: "#fbf1c7"
        block: "#fbf1c7"
        hints: "#665c54"

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
