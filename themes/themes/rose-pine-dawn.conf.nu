export def main [] {
    # extra desired values for the {{theme}} theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: ""
    # foreground: ""
    # cursor: ""

    {
        # color for nushell primitives
        separator: ""
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: ""
        empty: ""
        bool: ""
        int: ""
        filesize: ""
        duration: ""
        date: ""
        range: ""
        float: ""
        string: ""
        nothing: ""
        binary: ""
        cellpath: ""
        row_index: ""
        record: ""
        list: ""
        block: ""
        hints: ""

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: ""
        shape_bool: ""
        shape_int: ""
        shape_float: ""
        shape_range: ""
        shape_internalcall: ""
        shape_external: ""
        shape_externalarg: ""
        shape_literal: ""
        shape_operator: ""
        shape_signature: ""
        shape_string: ""
        shape_string_interpolation: ""
        shape_datetime: ""
        shape_list: ""
        shape_table: ""
        shape_record: ""
        shape_block: ""
        shape_filepath: ""
        shape_globpattern: ""
        shape_variable: ""
        shape_flag: ""
        shape_custom: ""
        shape_nothing: ""
    }
}
