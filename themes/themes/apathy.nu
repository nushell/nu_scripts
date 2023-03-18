export def main [] {
    # extra desired values for the apathy theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#031a16"
    # foreground: "#81b5ac"
    # cursor: "#81b5ac"

    {
        # color for nushell primitives
        separator: "#d2e7e4"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#883e96"
        empty: "#96883e"
        bool: "#d2e7e4"
        int: "#d2e7e4"
        filesize: "#d2e7e4"
        duration: "#d2e7e4"
        date: "#d2e7e4"
        range: "#d2e7e4"
        float: "#d2e7e4"
        string: "#d2e7e4"
        nothing: "#d2e7e4"
        binary: "#d2e7e4"
        cellpath: "#d2e7e4"
        row_index: "#883e96"
        record: "#d2e7e4"
        list: "#d2e7e4"
        block: "#d2e7e4"
        hints: "#2b685e"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#4c963e"
        shape_bool: "#963e4c"
        shape_int: "#4c963e"
        shape_float: "#4c963e"
        shape_range: "#3e4c96"
        shape_internalcall: "#963e4c"
        shape_external: "#963e4c"
        shape_externalarg: "#883e96"
        shape_literal: "#96883e"
        shape_operator: "#3e4c96"
        shape_signature: "#883e96"
        shape_string: "#883e96"
        shape_string_interpolation: "#963e4c"
        shape_datetime: "#963e4c"
        shape_list: "#963e4c"
        shape_table: "#96883e"
        shape_record: "#963e4c"
        shape_block: "#96883e"
        shape_filepath: "#963e4c"
        shape_globpattern: "#963e4c"
        shape_variable: "#4c963e"
        shape_flag: "#96883e"
        shape_custom: "#883e96"
        shape_nothing: "#963e4c"
    }
}
