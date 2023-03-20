export def main [] {
    # extra desired values for the oceanicnext theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1b2b34"
    # foreground: "#c0c5ce"
    # cursor: "#c0c5ce"

    {
        # color for nushell primitives
        separator: "#d8dee9"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#99c794"
        empty: "#6699cc"
        bool: "#d8dee9"
        int: "#d8dee9"
        filesize: "#d8dee9"
        duration: "#d8dee9"
        date: "#d8dee9"
        range: "#d8dee9"
        float: "#d8dee9"
        string: "#d8dee9"
        nothing: "#d8dee9"
        binary: "#d8dee9"
        cellpath: "#d8dee9"
        row_index: "#99c794"
        record: "#d8dee9"
        list: "#d8dee9"
        block: "#d8dee9"
        hints: "#65737e"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c594c5"
        shape_bool: "#5fb3b3"
        shape_int: "#c594c5"
        shape_float: "#c594c5"
        shape_range: "#fac863"
        shape_internalcall: "#5fb3b3"
        shape_external: "#5fb3b3"
        shape_externalarg: "#99c794"
        shape_literal: "#6699cc"
        shape_operator: "#fac863"
        shape_signature: "#99c794"
        shape_string: "#99c794"
        shape_string_interpolation: "#5fb3b3"
        shape_datetime: "#5fb3b3"
        shape_list: "#5fb3b3"
        shape_table: "#6699cc"
        shape_record: "#5fb3b3"
        shape_block: "#6699cc"
        shape_filepath: "#5fb3b3"
        shape_globpattern: "#5fb3b3"
        shape_variable: "#c594c5"
        shape_flag: "#6699cc"
        shape_custom: "#99c794"
        shape_nothing: "#5fb3b3"
    }
}
