export def main [] {
    # extra desired values for the chalkboard theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#29262f"
    # foreground: "#d9e6f2"
    # cursor: "#d9e6f2"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#aadbaa"
        empty: "#7372c3"
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
        row_index: "#aadbaa"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#323232"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#dbaada"
        shape_bool: "#aadadb"
        shape_int: "#dbaada"
        shape_float: "#dbaada"
        shape_range: "#dadbaa"
        shape_internalcall: "#aadadb"
        shape_external: "#72c2c3"
        shape_externalarg: "#aadbaa"
        shape_literal: "#7372c3"
        shape_operator: "#c2c372"
        shape_signature: "#aadbaa"
        shape_string: "#72c373"
        shape_string_interpolation: "#aadadb"
        shape_datetime: "#aadadb"
        shape_list: "#aadadb"
        shape_table: "#aaaadb"
        shape_record: "#aadadb"
        shape_block: "#aaaadb"
        shape_filepath: "#72c2c3"
        shape_globpattern: "#aadadb"
        shape_variable: "#c372c2"
        shape_flag: "#aaaadb"
        shape_custom: "#72c373"
        shape_nothing: "#aadadb"
    }
}
