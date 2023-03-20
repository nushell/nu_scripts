export def main [] {
    # extra desired values for the sat theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#758480"
    # foreground: "#23476a"
    # cursor: "#23476a"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#78ff74"
        empty: "#0007dd"
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
        row_index: "#78ff74"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#7d7d7d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#fa74ff"
        shape_bool: "#74fffa"
        shape_int: "#fa74ff"
        shape_float: "#fa74ff"
        shape_range: "#fffa74"
        shape_internalcall: "#74fffa"
        shape_external: "#00ddd6"
        shape_externalarg: "#78ff74"
        shape_literal: "#0007dd"
        shape_operator: "#ddd600"
        shape_signature: "#78ff74"
        shape_string: "#07dd00"
        shape_string_interpolation: "#74fffa"
        shape_datetime: "#74fffa"
        shape_list: "#74fffa"
        shape_table: "#7478ff"
        shape_record: "#74fffa"
        shape_block: "#7478ff"
        shape_filepath: "#00ddd6"
        shape_globpattern: "#74fffa"
        shape_variable: "#d600dd"
        shape_flag: "#7478ff"
        shape_custom: "#07dd00"
        shape_nothing: "#74fffa"
    }
}
