export def main [] {
    # extra desired values for the molokai theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1b1d1e"
    # foreground: "#bbbbbb"
    # cursor: "#bbbbbb"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#5fe0b1"
        empty: "#d08010"
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
        row_index: "#5fe0b1"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#555555"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff87af"
        shape_bool: "#ffce51"
        shape_int: "#ff87af"
        shape_float: "#ff87af"
        shape_range: "#6df2ff"
        shape_internalcall: "#ffce51"
        shape_external: "#d0a843"
        shape_externalarg: "#5fe0b1"
        shape_literal: "#d08010"
        shape_operator: "#60d4df"
        shape_signature: "#5fe0b1"
        shape_string: "#23e298"
        shape_string_interpolation: "#ffce51"
        shape_datetime: "#ffce51"
        shape_list: "#ffce51"
        shape_table: "#ffaf00"
        shape_record: "#ffce51"
        shape_block: "#ffaf00"
        shape_filepath: "#d0a843"
        shape_globpattern: "#ffce51"
        shape_variable: "#ff0087"
        shape_flag: "#ffaf00"
        shape_custom: "#23e298"
        shape_nothing: "#ffce51"
    }
}
