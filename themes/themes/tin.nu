export def main [] {
    # extra desired values for the tin theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2e2e35"
    # foreground: "#ffffff"
    # cursor: "#ffffff"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#78b57d"
        empty: "#534e8d"
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
        row_index: "#78b57d"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#000000"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b578b0"
        shape_bool: "#78b0b5"
        shape_int: "#b578b0"
        shape_float: "#b578b0"
        shape_range: "#b0b578"
        shape_internalcall: "#78b0b5"
        shape_external: "#4e888d"
        shape_externalarg: "#78b57d"
        shape_literal: "#534e8d"
        shape_operator: "#888d4e"
        shape_signature: "#78b57d"
        shape_string: "#4e8d53"
        shape_string_interpolation: "#78b0b5"
        shape_datetime: "#78b0b5"
        shape_list: "#78b0b5"
        shape_table: "#7d78b5"
        shape_record: "#78b0b5"
        shape_block: "#7d78b5"
        shape_filepath: "#4e888d"
        shape_globpattern: "#78b0b5"
        shape_variable: "#8d4e88"
        shape_flag: "#7d78b5"
        shape_custom: "#4e8d53"
        shape_nothing: "#78b0b5"
    }
}
