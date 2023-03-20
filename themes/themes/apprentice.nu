export def main [] {
    # extra desired values for the apprentice theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#262626"
    # foreground: "#bcbcbc"
    # cursor: "#bcbcbc"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#87af87"
        empty: "#ffffaf"
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
        row_index: "#87af87"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#6c6c6c"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#87afd7"
        shape_bool: "#5f875f"
        shape_int: "#87afd7"
        shape_float: "#87afd7"
        shape_range: "#5f8787"
        shape_internalcall: "#5f875f"
        shape_external: "#5f875f"
        shape_externalarg: "#87af87"
        shape_literal: "#ffffaf"
        shape_operator: "#5f8787"
        shape_signature: "#87af87"
        shape_string: "#87af87"
        shape_string_interpolation: "#5f875f"
        shape_datetime: "#5f875f"
        shape_list: "#5f875f"
        shape_table: "#ffffaf"
        shape_record: "#5f875f"
        shape_block: "#ffffaf"
        shape_filepath: "#5f875f"
        shape_globpattern: "#5f875f"
        shape_variable: "#87afd7"
        shape_flag: "#ffffaf"
        shape_custom: "#87af87"
        shape_nothing: "#5f875f"
    }
}
