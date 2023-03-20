export def main [] {
    # extra desired values for the red_alert theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#762423"
    # foreground: "#ffffff"
    # cursor: "#ffffff"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#aff08c"
        empty: "#489bee"
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
        row_index: "#aff08c"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#262626"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ddb7df"
        shape_bool: "#b7dfdd"
        shape_int: "#ddb7df"
        shape_float: "#ddb7df"
        shape_range: "#dfddb7"
        shape_internalcall: "#b7dfdd"
        shape_external: "#6bbeb8"
        shape_externalarg: "#aff08c"
        shape_literal: "#489bee"
        shape_operator: "#beb86b"
        shape_signature: "#aff08c"
        shape_string: "#71be6b"
        shape_string_interpolation: "#b7dfdd"
        shape_datetime: "#b7dfdd"
        shape_list: "#b7dfdd"
        shape_table: "#65aaf1"
        shape_record: "#b7dfdd"
        shape_block: "#65aaf1"
        shape_filepath: "#6bbeb8"
        shape_globpattern: "#b7dfdd"
        shape_variable: "#e979d7"
        shape_flag: "#65aaf1"
        shape_custom: "#71be6b"
        shape_nothing: "#b7dfdd"
    }
}
