export def main [] {
    # extra desired values for the eva_dim theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2a3b4d"
    # foreground: "#9fa2a6"
    # cursor: "#9fa2a6"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#5de561"
        empty: "#1ae1dc"
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
        row_index: "#5de561"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#55799c"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9c6cd3"
        shape_bool: "#4b8f77"
        shape_int: "#9c6cd3"
        shape_float: "#9c6cd3"
        shape_range: "#cfd05d"
        shape_internalcall: "#4b8f77"
        shape_external: "#4b8f77"
        shape_externalarg: "#5de561"
        shape_literal: "#1ae1dc"
        shape_operator: "#cfd05d"
        shape_signature: "#5de561"
        shape_string: "#5de561"
        shape_string_interpolation: "#4b8f77"
        shape_datetime: "#4b8f77"
        shape_list: "#4b8f77"
        shape_table: "#1ae1dc"
        shape_record: "#4b8f77"
        shape_block: "#1ae1dc"
        shape_filepath: "#4b8f77"
        shape_globpattern: "#4b8f77"
        shape_variable: "#9c6cd3"
        shape_flag: "#1ae1dc"
        shape_custom: "#5de561"
        shape_nothing: "#4b8f77"
    }
}
