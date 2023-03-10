export def main [] {
    # extra desired values for the {{theme}} theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ffffff"
    # foreground: "#0E1116"
    # cursor: "#044289"

    {
        # color for nushell primitives
        separator: "#8c959f"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#1a7f37"
        empty: "#0969da"
        bool: "#8c959f"
        int: "#8c959f"
        filesize: "#8c959f"
        duration: "#8c959f"
        date: "#8c959f"
        range: "#8c959f"
        float: "#8c959f"
        string: "#8c959f"
        nothing: "#8c959f"
        binary: "#8c959f"
        cellpath: "#8c959f"
        row_index: "#1a7f37"
        record: "#8c959f"
        list: "#8c959f"
        block: "#8c959f"
        hints: "#57606a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a475f9"
        shape_bool: "#3192aa"
        shape_int: "#a475f9"
        shape_float: "#a475f9"
        shape_range: "#633c01"
        shape_internalcall: "#3192aa"
        shape_external: "#1b7c83"
        shape_externalarg: "#1a7f37"
        shape_literal: "#0969da"
        shape_operator: "#4d2d00"
        shape_signature: "#1a7f37"
        shape_string: "#116329"
        shape_string_interpolation: "#3192aa"
        shape_datetime: "#3192aa"
        shape_list: "#3192aa"
        shape_table: "#218bff"
        shape_record: "#3192aa"
        shape_block: "#218bff"
        shape_filepath: "#1b7c83"
        shape_globpattern: "#3192aa"
        shape_variable: "#8250df"
        shape_flag: "#218bff"
        shape_custom: "#116329"
        shape_nothing: "#3192aa"
    }
}
