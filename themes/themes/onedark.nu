export def main [] {
    # extra desired values for the onedark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#282c34"
    # foreground: "#abb2bf"
    # cursor: "#abb2bf"

    {
        # color for nushell primitives
        separator: "#c8ccd4"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#98c379"
        empty: "#61afef"
        bool: "#c8ccd4"
        int: "#c8ccd4"
        filesize: "#c8ccd4"
        duration: "#c8ccd4"
        date: "#c8ccd4"
        range: "#c8ccd4"
        float: "#c8ccd4"
        string: "#c8ccd4"
        nothing: "#c8ccd4"
        binary: "#c8ccd4"
        cellpath: "#c8ccd4"
        row_index: "#98c379"
        record: "#c8ccd4"
        list: "#c8ccd4"
        block: "#c8ccd4"
        hints: "#545862"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c678dd"
        shape_bool: "#56b6c2"
        shape_int: "#c678dd"
        shape_float: "#c678dd"
        shape_range: "#e5c07b"
        shape_internalcall: "#56b6c2"
        shape_external: "#56b6c2"
        shape_externalarg: "#98c379"
        shape_literal: "#61afef"
        shape_operator: "#e5c07b"
        shape_signature: "#98c379"
        shape_string: "#98c379"
        shape_string_interpolation: "#56b6c2"
        shape_datetime: "#56b6c2"
        shape_list: "#56b6c2"
        shape_table: "#61afef"
        shape_record: "#56b6c2"
        shape_block: "#61afef"
        shape_filepath: "#56b6c2"
        shape_globpattern: "#56b6c2"
        shape_variable: "#c678dd"
        shape_flag: "#61afef"
        shape_custom: "#98c379"
        shape_nothing: "#56b6c2"
    }
}
