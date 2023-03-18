export def main [] {
    # extra desired values for the tube theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#231f20"
    # foreground: "#d9d8d8"
    # cursor: "#d9d8d8"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#00853e"
        empty: "#009ddc"
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
        row_index: "#00853e"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#737171"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#98005d"
        shape_bool: "#85cebc"
        shape_int: "#98005d"
        shape_float: "#98005d"
        shape_range: "#ffd204"
        shape_internalcall: "#85cebc"
        shape_external: "#85cebc"
        shape_externalarg: "#00853e"
        shape_literal: "#009ddc"
        shape_operator: "#ffd204"
        shape_signature: "#00853e"
        shape_string: "#00853e"
        shape_string_interpolation: "#85cebc"
        shape_datetime: "#85cebc"
        shape_list: "#85cebc"
        shape_table: "#009ddc"
        shape_record: "#85cebc"
        shape_block: "#009ddc"
        shape_filepath: "#85cebc"
        shape_globpattern: "#85cebc"
        shape_variable: "#98005d"
        shape_flag: "#009ddc"
        shape_custom: "#00853e"
        shape_nothing: "#85cebc"
    }
}
