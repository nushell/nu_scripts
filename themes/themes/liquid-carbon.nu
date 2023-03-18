export def main [] {
    # extra desired values for the liquid_carbon theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#303030"
    # foreground: "#afc2c2"
    # cursor: "#afc2c2"

    {
        # color for nushell primitives
        separator: "#bccccc"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#559a70"
        empty: "#0099cc"
        bool: "#bccccc"
        int: "#bccccc"
        filesize: "#bccccc"
        duration: "#bccccc"
        date: "#bccccc"
        range: "#bccccc"
        float: "#bccccc"
        string: "#bccccc"
        nothing: "#bccccc"
        binary: "#bccccc"
        cellpath: "#bccccc"
        row_index: "#559a70"
        record: "#bccccc"
        list: "#bccccc"
        block: "#bccccc"
        hints: "#000000"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#cc69c8"
        shape_bool: "#7ac4cc"
        shape_int: "#cc69c8"
        shape_float: "#cc69c8"
        shape_range: "#ccac00"
        shape_internalcall: "#7ac4cc"
        shape_external: "#7ac4cc"
        shape_externalarg: "#559a70"
        shape_literal: "#0099cc"
        shape_operator: "#ccac00"
        shape_signature: "#559a70"
        shape_string: "#559a70"
        shape_string_interpolation: "#7ac4cc"
        shape_datetime: "#7ac4cc"
        shape_list: "#7ac4cc"
        shape_table: "#0099cc"
        shape_record: "#7ac4cc"
        shape_block: "#0099cc"
        shape_filepath: "#7ac4cc"
        shape_globpattern: "#7ac4cc"
        shape_variable: "#cc69c8"
        shape_flag: "#0099cc"
        shape_custom: "#559a70"
        shape_nothing: "#7ac4cc"
    }
}
