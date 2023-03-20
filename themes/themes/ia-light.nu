export def main [] {
    # extra desired values for the ia_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f6f6f6"
    # foreground: "#181818"
    # cursor: "#181818"

    {
        # color for nushell primitives
        separator: "#f8f8f8"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#38781c"
        empty: "#48bac2"
        bool: "#f8f8f8"
        int: "#f8f8f8"
        filesize: "#f8f8f8"
        duration: "#f8f8f8"
        date: "#f8f8f8"
        range: "#f8f8f8"
        float: "#f8f8f8"
        string: "#f8f8f8"
        nothing: "#f8f8f8"
        binary: "#f8f8f8"
        cellpath: "#f8f8f8"
        row_index: "#38781c"
        record: "#f8f8f8"
        list: "#f8f8f8"
        block: "#f8f8f8"
        hints: "#898989"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a94598"
        shape_bool: "#2d6bb1"
        shape_int: "#a94598"
        shape_float: "#a94598"
        shape_range: "#c48218"
        shape_internalcall: "#2d6bb1"
        shape_external: "#2d6bb1"
        shape_externalarg: "#38781c"
        shape_literal: "#48bac2"
        shape_operator: "#c48218"
        shape_signature: "#38781c"
        shape_string: "#38781c"
        shape_string_interpolation: "#2d6bb1"
        shape_datetime: "#2d6bb1"
        shape_list: "#2d6bb1"
        shape_table: "#48bac2"
        shape_record: "#2d6bb1"
        shape_block: "#48bac2"
        shape_filepath: "#2d6bb1"
        shape_globpattern: "#2d6bb1"
        shape_variable: "#a94598"
        shape_flag: "#48bac2"
        shape_custom: "#38781c"
        shape_nothing: "#2d6bb1"
    }
}
