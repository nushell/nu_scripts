export def main [] {
    # extra desired values for the belafonte_day theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#d5ccba"
    # foreground: "#45373c"
    # cursor: "#45373c"

    {
        # color for nushell primitives
        separator: "#d5ccba"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#858162"
        empty: "#426a79"
        bool: "#d5ccba"
        int: "#d5ccba"
        filesize: "#d5ccba"
        duration: "#d5ccba"
        date: "#d5ccba"
        range: "#d5ccba"
        float: "#d5ccba"
        string: "#d5ccba"
        nothing: "#d5ccba"
        binary: "#d5ccba"
        cellpath: "#d5ccba"
        row_index: "#858162"
        record: "#d5ccba"
        list: "#d5ccba"
        block: "#d5ccba"
        hints: "#5e5252"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#97522c"
        shape_bool: "#989a9c"
        shape_int: "#97522c"
        shape_float: "#97522c"
        shape_range: "#eaa549"
        shape_internalcall: "#989a9c"
        shape_external: "#989a9c"
        shape_externalarg: "#858162"
        shape_literal: "#426a79"
        shape_operator: "#eaa549"
        shape_signature: "#858162"
        shape_string: "#858162"
        shape_string_interpolation: "#989a9c"
        shape_datetime: "#989a9c"
        shape_list: "#989a9c"
        shape_table: "#426a79"
        shape_record: "#989a9c"
        shape_block: "#426a79"
        shape_filepath: "#989a9c"
        shape_globpattern: "#989a9c"
        shape_variable: "#97522c"
        shape_flag: "#426a79"
        shape_custom: "#858162"
        shape_nothing: "#989a9c"
    }
}
