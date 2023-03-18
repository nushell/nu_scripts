export def main [] {
    # extra desired values for the dirtysea theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#e0e0e0"
    # foreground: "#000000"
    # cursor: "#000000"

    {
        # color for nushell primitives
        separator: "#c4d9c4"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#730073"
        empty: "#007300"
        bool: "#c4d9c4"
        int: "#c4d9c4"
        filesize: "#c4d9c4"
        duration: "#c4d9c4"
        date: "#c4d9c4"
        range: "#c4d9c4"
        float: "#c4d9c4"
        string: "#c4d9c4"
        nothing: "#c4d9c4"
        binary: "#c4d9c4"
        cellpath: "#c4d9c4"
        row_index: "#730073"
        record: "#c4d9c4"
        list: "#c4d9c4"
        block: "#c4d9c4"
        hints: "#707070"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#000090"
        shape_bool: "#755b00"
        shape_int: "#000090"
        shape_float: "#000090"
        shape_range: "#755b00"
        shape_internalcall: "#755b00"
        shape_external: "#755b00"
        shape_externalarg: "#730073"
        shape_literal: "#007300"
        shape_operator: "#755b00"
        shape_signature: "#730073"
        shape_string: "#730073"
        shape_string_interpolation: "#755b00"
        shape_datetime: "#755b00"
        shape_list: "#755b00"
        shape_table: "#007300"
        shape_record: "#755b00"
        shape_block: "#007300"
        shape_filepath: "#755b00"
        shape_globpattern: "#755b00"
        shape_variable: "#000090"
        shape_flag: "#007300"
        shape_custom: "#730073"
        shape_nothing: "#755b00"
    }
}
