export def main [] {
    # extra desired values for the seti_ui theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#151718"
    # foreground: "#d6d6d6"
    # cursor: "#d6d6d6"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#9fca56"
        empty: "#55b5db"
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
        row_index: "#9fca56"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#41535B"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a074c4"
        shape_bool: "#55dbbe"
        shape_int: "#a074c4"
        shape_float: "#a074c4"
        shape_range: "#e6cd69"
        shape_internalcall: "#55dbbe"
        shape_external: "#55dbbe"
        shape_externalarg: "#9fca56"
        shape_literal: "#55b5db"
        shape_operator: "#e6cd69"
        shape_signature: "#9fca56"
        shape_string: "#9fca56"
        shape_string_interpolation: "#55dbbe"
        shape_datetime: "#55dbbe"
        shape_list: "#55dbbe"
        shape_table: "#55b5db"
        shape_record: "#55dbbe"
        shape_block: "#55b5db"
        shape_filepath: "#55dbbe"
        shape_globpattern: "#55dbbe"
        shape_variable: "#a074c4"
        shape_flag: "#55b5db"
        shape_custom: "#9fca56"
        shape_nothing: "#55dbbe"
    }
}
