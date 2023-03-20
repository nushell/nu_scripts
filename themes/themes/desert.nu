export def main [] {
    # extra desired values for the desert theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#333333"
    # foreground: "#ffffff"
    # cursor: "#ffffff"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#55ff55"
        empty: "#cd853f"
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
        row_index: "#55ff55"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#555555"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff55ff"
        shape_bool: "#ffd700"
        shape_int: "#ff55ff"
        shape_float: "#ff55ff"
        shape_range: "#ffff55"
        shape_internalcall: "#ffd700"
        shape_external: "#ffa0a0"
        shape_externalarg: "#55ff55"
        shape_literal: "#cd853f"
        shape_operator: "#f0e68c"
        shape_signature: "#55ff55"
        shape_string: "#98fb98"
        shape_string_interpolation: "#ffd700"
        shape_datetime: "#ffd700"
        shape_list: "#ffd700"
        shape_table: "#87ceff"
        shape_record: "#ffd700"
        shape_block: "#87ceff"
        shape_filepath: "#ffa0a0"
        shape_globpattern: "#ffd700"
        shape_variable: "#ffdead"
        shape_flag: "#87ceff"
        shape_custom: "#98fb98"
        shape_nothing: "#ffd700"
    }
}
