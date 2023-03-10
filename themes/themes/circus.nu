export def main [] {
    # extra desired values for the circus theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#191919"
    # foreground: "#a7a7a7"
    # cursor: "#a7a7a7"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#84b97c"
        empty: "#639ee4"
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
        row_index: "#84b97c"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#5f5a60"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b888e2"
        shape_bool: "#4bb1a7"
        shape_int: "#b888e2"
        shape_float: "#b888e2"
        shape_range: "#c3ba63"
        shape_internalcall: "#4bb1a7"
        shape_external: "#4bb1a7"
        shape_externalarg: "#84b97c"
        shape_literal: "#639ee4"
        shape_operator: "#c3ba63"
        shape_signature: "#84b97c"
        shape_string: "#84b97c"
        shape_string_interpolation: "#4bb1a7"
        shape_datetime: "#4bb1a7"
        shape_list: "#4bb1a7"
        shape_table: "#639ee4"
        shape_record: "#4bb1a7"
        shape_block: "#639ee4"
        shape_filepath: "#4bb1a7"
        shape_globpattern: "#4bb1a7"
        shape_variable: "#b888e2"
        shape_flag: "#639ee4"
        shape_custom: "#84b97c"
        shape_nothing: "#4bb1a7"
    }
}
