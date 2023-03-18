export def main [] {
    # extra desired values for the chalk theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#151515"
    # foreground: "#d0d0d0"
    # cursor: "#d0d0d0"

    {
        # color for nushell primitives
        separator: "#f5f5f5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#acc267"
        empty: "#6fc2ef"
        bool: "#f5f5f5"
        int: "#f5f5f5"
        filesize: "#f5f5f5"
        duration: "#f5f5f5"
        date: "#f5f5f5"
        range: "#f5f5f5"
        float: "#f5f5f5"
        string: "#f5f5f5"
        nothing: "#f5f5f5"
        binary: "#f5f5f5"
        cellpath: "#f5f5f5"
        row_index: "#acc267"
        record: "#f5f5f5"
        list: "#f5f5f5"
        block: "#f5f5f5"
        hints: "#505050"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#e1a3ee"
        shape_bool: "#12cfc0"
        shape_int: "#e1a3ee"
        shape_float: "#e1a3ee"
        shape_range: "#ddb26f"
        shape_internalcall: "#12cfc0"
        shape_external: "#12cfc0"
        shape_externalarg: "#acc267"
        shape_literal: "#6fc2ef"
        shape_operator: "#ddb26f"
        shape_signature: "#acc267"
        shape_string: "#acc267"
        shape_string_interpolation: "#12cfc0"
        shape_datetime: "#12cfc0"
        shape_list: "#12cfc0"
        shape_table: "#6fc2ef"
        shape_record: "#12cfc0"
        shape_block: "#6fc2ef"
        shape_filepath: "#12cfc0"
        shape_globpattern: "#12cfc0"
        shape_variable: "#e1a3ee"
        shape_flag: "#6fc2ef"
        shape_custom: "#acc267"
        shape_nothing: "#12cfc0"
    }
}
