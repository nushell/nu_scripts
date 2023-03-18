export def main [] {
    # extra desired values for the spacemacs theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1f2022"
    # foreground: "#a3a3a3"
    # cursor: "#a3a3a3"

    {
        # color for nushell primitives
        separator: "#f8f8f8"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#67b11d"
        empty: "#4f97d7"
        bool: "#f8f8f8"
        int: "#f8f8f8"
        filesize: "#f8f8f8"
        duration: "#f8f8f8"
        date: "#f8f8f8"
        range: "#f8f8f8"
        float: "#f8f8f8"
        string: "#f8f8f8"
        nothing: "#f8f8f8"
        binary: "#f8f8f8"
        cellpath: "#f8f8f8"
        row_index: "#67b11d"
        record: "#f8f8f8"
        list: "#f8f8f8"
        block: "#f8f8f8"
        hints: "#585858"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a31db1"
        shape_bool: "#2d9574"
        shape_int: "#a31db1"
        shape_float: "#a31db1"
        shape_range: "#b1951d"
        shape_internalcall: "#2d9574"
        shape_external: "#2d9574"
        shape_externalarg: "#67b11d"
        shape_literal: "#4f97d7"
        shape_operator: "#b1951d"
        shape_signature: "#67b11d"
        shape_string: "#67b11d"
        shape_string_interpolation: "#2d9574"
        shape_datetime: "#2d9574"
        shape_list: "#2d9574"
        shape_table: "#4f97d7"
        shape_record: "#2d9574"
        shape_block: "#4f97d7"
        shape_filepath: "#2d9574"
        shape_globpattern: "#2d9574"
        shape_variable: "#a31db1"
        shape_flag: "#4f97d7"
        shape_custom: "#67b11d"
        shape_nothing: "#2d9574"
    }
}
