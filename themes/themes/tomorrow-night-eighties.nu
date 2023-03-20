export def main [] {
    # extra desired values for the tomorrow_night-eighties theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2d2d2d"
    # foreground: "#cccccc"
    # cursor: "#cccccc"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#99cc99"
        empty: "#6699cc"
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
        row_index: "#99cc99"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#999999"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#cc99cc"
        shape_bool: "#66cccc"
        shape_int: "#cc99cc"
        shape_float: "#cc99cc"
        shape_range: "#ffcc66"
        shape_internalcall: "#66cccc"
        shape_external: "#66cccc"
        shape_externalarg: "#99cc99"
        shape_literal: "#6699cc"
        shape_operator: "#ffcc66"
        shape_signature: "#99cc99"
        shape_string: "#99cc99"
        shape_string_interpolation: "#66cccc"
        shape_datetime: "#66cccc"
        shape_list: "#66cccc"
        shape_table: "#6699cc"
        shape_record: "#66cccc"
        shape_block: "#6699cc"
        shape_filepath: "#66cccc"
        shape_globpattern: "#66cccc"
        shape_variable: "#cc99cc"
        shape_flag: "#6699cc"
        shape_custom: "#99cc99"
        shape_nothing: "#66cccc"
    }
}
