export def main [] {
    # extra desired values for the unikitty_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2e2a31"
    # foreground: "#bcbabe"
    # cursor: "#bcbabe"

    {
        # color for nushell primitives
        separator: "#f5f4f7"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#17ad98"
        empty: "#796af5"
        bool: "#f5f4f7"
        int: "#f5f4f7"
        filesize: "#f5f4f7"
        duration: "#f5f4f7"
        date: "#f5f4f7"
        range: "#f5f4f7"
        float: "#f5f4f7"
        string: "#f5f4f7"
        nothing: "#f5f4f7"
        binary: "#f5f4f7"
        cellpath: "#f5f4f7"
        row_index: "#17ad98"
        record: "#f5f4f7"
        list: "#f5f4f7"
        block: "#f5f4f7"
        hints: "#838085"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#bb60ea"
        shape_bool: "#149bda"
        shape_int: "#bb60ea"
        shape_float: "#bb60ea"
        shape_range: "#dc8a0e"
        shape_internalcall: "#149bda"
        shape_external: "#149bda"
        shape_externalarg: "#17ad98"
        shape_literal: "#796af5"
        shape_operator: "#dc8a0e"
        shape_signature: "#17ad98"
        shape_string: "#17ad98"
        shape_string_interpolation: "#149bda"
        shape_datetime: "#149bda"
        shape_list: "#149bda"
        shape_table: "#796af5"
        shape_record: "#149bda"
        shape_block: "#796af5"
        shape_filepath: "#149bda"
        shape_globpattern: "#149bda"
        shape_variable: "#bb60ea"
        shape_flag: "#796af5"
        shape_custom: "#17ad98"
        shape_nothing: "#149bda"
    }
}
