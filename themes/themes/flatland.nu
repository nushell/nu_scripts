export def main [] {
    # extra desired values for the flatland theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1d1f21"
    # foreground: "#b8dbef"
    # cursor: "#b8dbef"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a7d42c"
        empty: "#5096be"
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
        row_index: "#a7d42c"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#1d1d19"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#695abc"
        shape_bool: "#d63865"
        shape_int: "#695abc"
        shape_float: "#695abc"
        shape_range: "#ff8949"
        shape_internalcall: "#d63865"
        shape_external: "#d63865"
        shape_externalarg: "#a7d42c"
        shape_literal: "#5096be"
        shape_operator: "#f4ef6d"
        shape_signature: "#a7d42c"
        shape_string: "#9fd364"
        shape_string_interpolation: "#d63865"
        shape_datetime: "#d63865"
        shape_list: "#d63865"
        shape_table: "#61b9d0"
        shape_record: "#d63865"
        shape_block: "#61b9d0"
        shape_filepath: "#d63865"
        shape_globpattern: "#d63865"
        shape_variable: "#695abc"
        shape_flag: "#61b9d0"
        shape_custom: "#9fd364"
        shape_nothing: "#d63865"
    }
}
