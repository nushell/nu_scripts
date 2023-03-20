export def dracula [] {
    # extra desired values for the dracula theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#282936"
    # foreground: "#e9e9f4"
    # cursor: "#e9e9f4"

    {
        # color for nushell primitives
        separator: "#f7f7fb"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#ebff87"
        empty: "#62d6e8"
        bool: "#f7f7fb"
        int: "#f7f7fb"
        filesize: "#f7f7fb"
        duration: "#f7f7fb"
        date: "#f7f7fb"
        range: "#f7f7fb"
        float: "#f7f7fb"
        string: "#f7f7fb"
        nothing: "#f7f7fb"
        binary: "#f7f7fb"
        cellpath: "#f7f7fb"
        row_index: "#ebff87"
        record: "#f7f7fb"
        list: "#f7f7fb"
        block: "#f7f7fb"
        hints: "#626483"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b45bcf"
        shape_bool: "#a1efe4"
        shape_int: "#b45bcf"
        shape_float: "#b45bcf"
        shape_range: "#00f769"
        shape_internalcall: "#a1efe4"
        shape_external: "#a1efe4"
        shape_externalarg: "#ebff87"
        shape_literal: "#62d6e8"
        shape_operator: "#00f769"
        shape_signature: "#ebff87"
        shape_string: "#ebff87"
        shape_string_interpolation: "#a1efe4"
        shape_datetime: "#a1efe4"
        shape_list: "#a1efe4"
        shape_table: "#62d6e8"
        shape_record: "#a1efe4"
        shape_block: "#62d6e8"
        shape_filepath: "#a1efe4"
        shape_globpattern: "#a1efe4"
        shape_variable: "#b45bcf"
        shape_flag: "#62d6e8"
        shape_custom: "#ebff87"
        shape_nothing: "#a1efe4"
    }
}
