export def main [] {
    # extra desired values for the challenger_deep theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1e1c31"
    # foreground: "#cbe3e7"
    # cursor: "#cbe3e7"

    {
        # color for nushell primitives
        separator: "#a6b3cc"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#62d196"
        empty: "#91ddff"
        bool: "#a6b3cc"
        int: "#a6b3cc"
        filesize: "#a6b3cc"
        duration: "#a6b3cc"
        date: "#a6b3cc"
        range: "#a6b3cc"
        float: "#a6b3cc"
        string: "#a6b3cc"
        nothing: "#a6b3cc"
        binary: "#a6b3cc"
        cellpath: "#a6b3cc"
        row_index: "#62d196"
        record: "#a6b3cc"
        list: "#a6b3cc"
        block: "#a6b3cc"
        hints: "#100e23"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#906cff"
        shape_bool: "#63f2f1"
        shape_int: "#906cff"
        shape_float: "#906cff"
        shape_range: "#ffb378"
        shape_internalcall: "#63f2f1"
        shape_external: "#aaffe4"
        shape_externalarg: "#62d196"
        shape_literal: "#91ddff"
        shape_operator: "#ffe9aa"
        shape_signature: "#62d196"
        shape_string: "#95ffa4"
        shape_string_interpolation: "#63f2f1"
        shape_datetime: "#63f2f1"
        shape_list: "#63f2f1"
        shape_table: "#65b2ff"
        shape_record: "#63f2f1"
        shape_block: "#65b2ff"
        shape_filepath: "#aaffe4"
        shape_globpattern: "#63f2f1"
        shape_variable: "#c991e1"
        shape_flag: "#65b2ff"
        shape_custom: "#95ffa4"
        shape_nothing: "#63f2f1"
    }
}
