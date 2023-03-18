export def main [] {
    # extra desired values for the symphonic theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#ffffff"
    # cursor: "#ffffff"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#56db3a"
        empty: "#0084d4"
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
        row_index: "#56db3a"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#1b1d21"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b729d9"
        shape_bool: "#ccccff"
        shape_int: "#b729d9"
        shape_float: "#b729d9"
        shape_range: "#ff8400"
        shape_internalcall: "#ccccff"
        shape_external: "#ccccff"
        shape_externalarg: "#56db3a"
        shape_literal: "#0084d4"
        shape_operator: "#ff8400"
        shape_signature: "#56db3a"
        shape_string: "#56db3a"
        shape_string_interpolation: "#ccccff"
        shape_datetime: "#ccccff"
        shape_list: "#ccccff"
        shape_table: "#0084d4"
        shape_record: "#ccccff"
        shape_block: "#0084d4"
        shape_filepath: "#ccccff"
        shape_globpattern: "#ccccff"
        shape_variable: "#b729d9"
        shape_flag: "#0084d4"
        shape_custom: "#56db3a"
        shape_nothing: "#ccccff"
    }
}
