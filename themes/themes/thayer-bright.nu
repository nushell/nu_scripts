export def main [] {
    # extra desired values for the thayer_bright theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1b1d1e"
    # foreground: "#f8f8f8"
    # cursor: "#f8f8f8"

    {
        # color for nushell primitives
        separator: "#f8f8f2"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b6e354"
        empty: "#2757d6"
        bool: "#f8f8f2"
        int: "#f8f8f2"
        filesize: "#f8f8f2"
        duration: "#f8f8f2"
        date: "#f8f8f2"
        range: "#f8f8f2"
        float: "#f8f8f2"
        string: "#f8f8f2"
        nothing: "#f8f8f2"
        binary: "#f8f8f2"
        cellpath: "#f8f8f2"
        row_index: "#b6e354"
        record: "#f8f8f2"
        list: "#f8f8f2"
        block: "#f8f8f2"
        hints: "#505354"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9e6ffe"
        shape_bool: "#23cfd5"
        shape_int: "#9e6ffe"
        shape_float: "#9e6ffe"
        shape_range: "#feed6c"
        shape_internalcall: "#23cfd5"
        shape_external: "#38c8b5"
        shape_externalarg: "#b6e354"
        shape_literal: "#2757d6"
        shape_operator: "#f4fd22"
        shape_signature: "#b6e354"
        shape_string: "#4df840"
        shape_string_interpolation: "#23cfd5"
        shape_datetime: "#23cfd5"
        shape_list: "#23cfd5"
        shape_table: "#3f78ff"
        shape_record: "#23cfd5"
        shape_block: "#3f78ff"
        shape_filepath: "#38c8b5"
        shape_globpattern: "#23cfd5"
        shape_variable: "#8c54fe"
        shape_flag: "#3f78ff"
        shape_custom: "#4df840"
        shape_nothing: "#23cfd5"
    }
}
