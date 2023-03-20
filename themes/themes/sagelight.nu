export def main [] {
    # extra desired values for the sagelight theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f8f8f8"
    # foreground: "#383838"
    # cursor: "#383838"

    {
        # color for nushell primitives
        separator: "#181818"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a0d2c8"
        empty: "#a0a7d2"
        bool: "#181818"
        int: "#181818"
        filesize: "#181818"
        duration: "#181818"
        date: "#181818"
        range: "#181818"
        float: "#181818"
        string: "#181818"
        nothing: "#181818"
        binary: "#181818"
        cellpath: "#181818"
        row_index: "#a0d2c8"
        record: "#181818"
        list: "#181818"
        block: "#181818"
        hints: "#b8b8b8"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c8a0d2"
        shape_bool: "#a2d6f5"
        shape_int: "#c8a0d2"
        shape_float: "#c8a0d2"
        shape_range: "#ffdc61"
        shape_internalcall: "#a2d6f5"
        shape_external: "#a2d6f5"
        shape_externalarg: "#a0d2c8"
        shape_literal: "#a0a7d2"
        shape_operator: "#ffdc61"
        shape_signature: "#a0d2c8"
        shape_string: "#a0d2c8"
        shape_string_interpolation: "#a2d6f5"
        shape_datetime: "#a2d6f5"
        shape_list: "#a2d6f5"
        shape_table: "#a0a7d2"
        shape_record: "#a2d6f5"
        shape_block: "#a0a7d2"
        shape_filepath: "#a2d6f5"
        shape_globpattern: "#a2d6f5"
        shape_variable: "#c8a0d2"
        shape_flag: "#a0a7d2"
        shape_custom: "#a0d2c8"
        shape_nothing: "#a2d6f5"
    }
}
