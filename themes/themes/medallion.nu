export def main [] {
    # extra desired values for the medallion theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1d1908"
    # foreground: "#cac296"
    # cursor: "#cac296"

    {
        # color for nushell primitives
        separator: "#fed698"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b2ca3b"
        empty: "#616bb0"
        bool: "#fed698"
        int: "#fed698"
        filesize: "#fed698"
        duration: "#fed698"
        date: "#fed698"
        range: "#fed698"
        float: "#fed698"
        string: "#fed698"
        nothing: "#fed698"
        binary: "#fed698"
        cellpath: "#fed698"
        row_index: "#b2ca3b"
        record: "#fed698"
        list: "#fed698"
        block: "#fed698"
        hints: "#5e5219"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ffa0ff"
        shape_bool: "#ffbc51"
        shape_int: "#ffa0ff"
        shape_float: "#ffa0ff"
        shape_range: "#ffe54a"
        shape_internalcall: "#ffbc51"
        shape_external: "#916c25"
        shape_externalarg: "#b2ca3b"
        shape_literal: "#616bb0"
        shape_operator: "#d3bd26"
        shape_signature: "#b2ca3b"
        shape_string: "#7c8b16"
        shape_string_interpolation: "#ffbc51"
        shape_datetime: "#ffbc51"
        shape_list: "#ffbc51"
        shape_table: "#acb8ff"
        shape_record: "#ffbc51"
        shape_block: "#acb8ff"
        shape_filepath: "#916c25"
        shape_globpattern: "#ffbc51"
        shape_variable: "#8c5a90"
        shape_flag: "#acb8ff"
        shape_custom: "#7c8b16"
        shape_nothing: "#ffbc51"
    }
}
