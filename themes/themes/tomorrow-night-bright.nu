export def main [] {
    # extra desired values for the tomorrow_night-bright theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#e9e9e9"
    # cursor: "#e9e9e9"

    {
        # color for nushell primitives
        separator: "#fffefe"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b9c949"
        empty: "#79a6da"
        bool: "#fffefe"
        int: "#fffefe"
        filesize: "#fffefe"
        duration: "#fffefe"
        date: "#fffefe"
        range: "#fffefe"
        float: "#fffefe"
        string: "#fffefe"
        nothing: "#fffefe"
        binary: "#fffefe"
        cellpath: "#fffefe"
        row_index: "#b9c949"
        record: "#fffefe"
        list: "#fffefe"
        block: "#fffefe"
        hints: "#000000"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c396d7"
        shape_bool: "#70c0b1"
        shape_int: "#c396d7"
        shape_float: "#c396d7"
        shape_range: "#e6c446"
        shape_internalcall: "#70c0b1"
        shape_external: "#70c0b1"
        shape_externalarg: "#b9c949"
        shape_literal: "#79a6da"
        shape_operator: "#e7c547"
        shape_signature: "#b9c949"
        shape_string: "#b9ca49"
        shape_string_interpolation: "#70c0b1"
        shape_datetime: "#70c0b1"
        shape_list: "#70c0b1"
        shape_table: "#79a6da"
        shape_record: "#70c0b1"
        shape_block: "#79a6da"
        shape_filepath: "#70c0b1"
        shape_globpattern: "#70c0b1"
        shape_variable: "#c397d8"
        shape_flag: "#79a6da"
        shape_custom: "#b9ca49"
        shape_nothing: "#70c0b1"
    }
}
