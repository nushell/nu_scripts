export def main [] {
    # extra desired values for the c64 theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#40318d"
    # foreground: "#7869c4"
    # cursor: "#7869c4"

    {
        # color for nushell primitives
        separator: "#f7f7f7"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#55a049"
        empty: "#40318d"
        bool: "#f7f7f7"
        int: "#f7f7f7"
        filesize: "#f7f7f7"
        duration: "#f7f7f7"
        date: "#f7f7f7"
        range: "#f7f7f7"
        float: "#f7f7f7"
        string: "#f7f7f7"
        nothing: "#f7f7f7"
        binary: "#f7f7f7"
        cellpath: "#f7f7f7"
        row_index: "#55a049"
        record: "#f7f7f7"
        list: "#f7f7f7"
        block: "#f7f7f7"
        hints: "#000000"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8b3f96"
        shape_bool: "#67b6bd"
        shape_int: "#8b3f96"
        shape_float: "#8b3f96"
        shape_range: "#bfce72"
        shape_internalcall: "#67b6bd"
        shape_external: "#67b6bd"
        shape_externalarg: "#55a049"
        shape_literal: "#40318d"
        shape_operator: "#bfce72"
        shape_signature: "#55a049"
        shape_string: "#55a049"
        shape_string_interpolation: "#67b6bd"
        shape_datetime: "#67b6bd"
        shape_list: "#67b6bd"
        shape_table: "#40318d"
        shape_record: "#67b6bd"
        shape_block: "#40318d"
        shape_filepath: "#67b6bd"
        shape_globpattern: "#67b6bd"
        shape_variable: "#8b3f96"
        shape_flag: "#40318d"
        shape_custom: "#55a049"
        shape_nothing: "#67b6bd"
    }
}
