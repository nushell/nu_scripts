export def main [] {
    # extra desired values for the sourcerer2 theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#222222"
    # foreground: "#c2c2b0"
    # cursor: "#c2c2b0"

    {
        # color for nushell primitives
        separator: "#c1cdc1"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b1d631"
        empty: "#6688aa"
        bool: "#c1cdc1"
        int: "#c1cdc1"
        filesize: "#c1cdc1"
        duration: "#c1cdc1"
        date: "#c1cdc1"
        range: "#c1cdc1"
        float: "#c1cdc1"
        string: "#c1cdc1"
        nothing: "#c1cdc1"
        binary: "#c1cdc1"
        cellpath: "#c1cdc1"
        row_index: "#b1d631"
        record: "#c1cdc1"
        list: "#c1cdc1"
        block: "#c1cdc1"
        hints: "#181818"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8181a6"
        shape_bool: "#87ceeb"
        shape_int: "#8181a6"
        shape_float: "#8181a6"
        shape_range: "#87875f"
        shape_internalcall: "#87ceeb"
        shape_external: "#528b8b"
        shape_externalarg: "#b1d631"
        shape_literal: "#6688aa"
        shape_operator: "#ff9800"
        shape_signature: "#b1d631"
        shape_string: "#719611"
        shape_string_interpolation: "#87ceeb"
        shape_datetime: "#87ceeb"
        shape_list: "#87ceeb"
        shape_table: "#90b0d1"
        shape_record: "#87ceeb"
        shape_block: "#90b0d1"
        shape_filepath: "#528b8b"
        shape_globpattern: "#87ceeb"
        shape_variable: "#8f6f8f"
        shape_flag: "#90b0d1"
        shape_custom: "#719611"
        shape_nothing: "#87ceeb"
    }
}
