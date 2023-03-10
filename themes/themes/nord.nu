export def main [] {
    # extra desired values for the nord theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2e3440"
    # foreground: "#e5e9f0"
    # cursor: "#e5e9f0"

    {
        # color for nushell primitives
        separator: "#8fbcbb"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a3be8c"
        empty: "#81a1c1"
        bool: "#8fbcbb"
        int: "#8fbcbb"
        filesize: "#8fbcbb"
        duration: "#8fbcbb"
        date: "#8fbcbb"
        range: "#8fbcbb"
        float: "#8fbcbb"
        string: "#8fbcbb"
        nothing: "#8fbcbb"
        binary: "#8fbcbb"
        cellpath: "#8fbcbb"
        row_index: "#a3be8c"
        record: "#8fbcbb"
        list: "#8fbcbb"
        block: "#8fbcbb"
        hints: "#4c566a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b48ead"
        shape_bool: "#88c0d0"
        shape_int: "#b48ead"
        shape_float: "#b48ead"
        shape_range: "#ebcb8b"
        shape_internalcall: "#88c0d0"
        shape_external: "#88c0d0"
        shape_externalarg: "#a3be8c"
        shape_literal: "#81a1c1"
        shape_operator: "#ebcb8b"
        shape_signature: "#a3be8c"
        shape_string: "#a3be8c"
        shape_string_interpolation: "#88c0d0"
        shape_datetime: "#88c0d0"
        shape_list: "#88c0d0"
        shape_table: "#81a1c1"
        shape_record: "#88c0d0"
        shape_block: "#81a1c1"
        shape_filepath: "#88c0d0"
        shape_globpattern: "#88c0d0"
        shape_variable: "#b48ead"
        shape_flag: "#81a1c1"
        shape_custom: "#a3be8c"
        shape_nothing: "#88c0d0"
    }
}
