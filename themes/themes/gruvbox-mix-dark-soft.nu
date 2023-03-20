export def main [] {
    # extra desired values for the gruvbox_mix-dark-soft theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#32302f"
    # foreground: "#e2cca9"
    # cursor: "#e2cca9"

    {
        # color for nushell primitives
        separator: "#e2cca9"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b0b846"
        empty: "#80aa9e"
        bool: "#e2cca9"
        int: "#e2cca9"
        filesize: "#e2cca9"
        duration: "#e2cca9"
        date: "#e2cca9"
        range: "#e2cca9"
        float: "#e2cca9"
        string: "#e2cca9"
        nothing: "#e2cca9"
        binary: "#e2cca9"
        cellpath: "#e2cca9"
        row_index: "#b0b846"
        record: "#e2cca9"
        list: "#e2cca9"
        block: "#e2cca9"
        hints: "#32302f"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d3869b"
        shape_bool: "#8bba7f"
        shape_int: "#d3869b"
        shape_float: "#d3869b"
        shape_range: "#e9b143"
        shape_internalcall: "#8bba7f"
        shape_external: "#8bba7f"
        shape_externalarg: "#b0b846"
        shape_literal: "#80aa9e"
        shape_operator: "#e9b143"
        shape_signature: "#b0b846"
        shape_string: "#b0b846"
        shape_string_interpolation: "#8bba7f"
        shape_datetime: "#8bba7f"
        shape_list: "#8bba7f"
        shape_table: "#80aa9e"
        shape_record: "#8bba7f"
        shape_block: "#80aa9e"
        shape_filepath: "#8bba7f"
        shape_globpattern: "#8bba7f"
        shape_variable: "#d3869b"
        shape_flag: "#80aa9e"
        shape_custom: "#b0b846"
        shape_nothing: "#8bba7f"
    }
}
