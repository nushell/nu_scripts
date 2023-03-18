export def main [] {
    # extra desired values for the seafoam_pastel theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#243435"
    # foreground: "#d4e7d4"
    # cursor: "#d4e7d4"

    {
        # color for nushell primitives
        separator: "#e0e0e0"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#98d9aa"
        empty: "#4d7b82"
        bool: "#e0e0e0"
        int: "#e0e0e0"
        filesize: "#e0e0e0"
        duration: "#e0e0e0"
        date: "#e0e0e0"
        range: "#e0e0e0"
        float: "#e0e0e0"
        string: "#e0e0e0"
        nothing: "#e0e0e0"
        binary: "#e0e0e0"
        cellpath: "#e0e0e0"
        row_index: "#98d9aa"
        record: "#e0e0e0"
        list: "#e0e0e0"
        block: "#e0e0e0"
        hints: "#8a8a8a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d6b2a1"
        shape_bool: "#ade0e0"
        shape_int: "#d6b2a1"
        shape_float: "#d6b2a1"
        shape_range: "#fae79d"
        shape_internalcall: "#ade0e0"
        shape_external: "#729494"
        shape_externalarg: "#98d9aa"
        shape_literal: "#4d7b82"
        shape_operator: "#ada16d"
        shape_signature: "#98d9aa"
        shape_string: "#728c62"
        shape_string_interpolation: "#ade0e0"
        shape_datetime: "#ade0e0"
        shape_list: "#ade0e0"
        shape_table: "#7ac3cf"
        shape_record: "#ade0e0"
        shape_block: "#7ac3cf"
        shape_filepath: "#729494"
        shape_globpattern: "#ade0e0"
        shape_variable: "#8a7267"
        shape_flag: "#7ac3cf"
        shape_custom: "#728c62"
        shape_nothing: "#ade0e0"
    }
}
