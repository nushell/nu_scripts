export def main [] {
    # extra desired values for the embark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1e1c31"
    # foreground: "#cbe3e7"
    # cursor: "#cbe3e7"

    {
        # color for nushell primitives
        separator: "#8a889d"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#62d196"
        empty: "#91ddff"
        bool: "#8a889d"
        int: "#8a889d"
        filesize: "#8a889d"
        duration: "#8a889d"
        date: "#8a889d"
        range: "#8a889d"
        float: "#8a889d"
        string: "#8a889d"
        nothing: "#8a889d"
        binary: "#8a889d"
        cellpath: "#8a889d"
        row_index: "#62d196"
        record: "#8a889d"
        list: "#8a889d"
        block: "#8a889d"
        hints: "#585273"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a37acc"
        shape_bool: "#63f2f1"
        shape_int: "#a37acc"
        shape_float: "#a37acc"
        shape_range: "#f2b482"
        shape_internalcall: "#63f2f1"
        shape_external: "#87dfeb"
        shape_externalarg: "#62d196"
        shape_literal: "#91ddff"
        shape_operator: "#ffe6b3"
        shape_signature: "#62d196"
        shape_string: "#a1efd3"
        shape_string_interpolation: "#63f2f1"
        shape_datetime: "#63f2f1"
        shape_list: "#63f2f1"
        shape_table: "#65b2ff"
        shape_record: "#63f2f1"
        shape_block: "#65b2ff"
        shape_filepath: "#87dfeb"
        shape_globpattern: "#63f2f1"
        shape_variable: "#d4bfff"
        shape_flag: "#65b2ff"
        shape_custom: "#a1efd3"
        shape_nothing: "#63f2f1"
    }
}
