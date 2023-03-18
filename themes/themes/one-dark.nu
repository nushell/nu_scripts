export def main [] {
    # extra desired values for the one_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1e2127"
    # foreground: "#5c6370"
    # cursor: "#5c6370"

    {
        # color for nushell primitives
        separator: "#fffefe"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#98c379"
        empty: "#61afef"
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
        row_index: "#98c379"
        record: "#fffefe"
        list: "#fffefe"
        block: "#fffefe"
        hints: "#5c6370"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c678dd"
        shape_bool: "#56b6c2"
        shape_int: "#c678dd"
        shape_float: "#c678dd"
        shape_range: "#d19a66"
        shape_internalcall: "#56b6c2"
        shape_external: "#56b6c2"
        shape_externalarg: "#98c379"
        shape_literal: "#61afef"
        shape_operator: "#d19a66"
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
