export def main [] {
    # extra desired values for the 3024 theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#090300"
    # foreground: "#a5a2a2"
    # cursor: "#a5a2a2"

    {
        # color for nushell primitives
        separator: "#f7f7f7"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#01a252"
        empty: "#01a0e4"
        bool: "#f7f7f7"
        int: "#f7f7f7"
        filesize: "#f7f7f7"
        duration: "#f7f7f7"
        date: "#f7f7f7"
        range: "#f7f7f7"
        float: "#f7f7f7"
        string: "#f7f7f7"
        nothing: "#f7f7f7"
        binary: "#f7f7f7"
        cellpath: "#f7f7f7"
        row_index: "#01a252"
        record: "#f7f7f7"
        list: "#f7f7f7"
        block: "#f7f7f7"
        hints: "#5c5855"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a16a94"
        shape_bool: "#b5e4f4"
        shape_int: "#a16a94"
        shape_float: "#a16a94"
        shape_range: "#fded02"
        shape_internalcall: "#b5e4f4"
        shape_external: "#b5e4f4"
        shape_externalarg: "#01a252"
        shape_literal: "#01a0e4"
        shape_operator: "#fded02"
        shape_signature: "#01a252"
        shape_string: "#01a252"
        shape_string_interpolation: "#b5e4f4"
        shape_datetime: "#b5e4f4"
        shape_list: "#b5e4f4"
        shape_table: "#01a0e4"
        shape_record: "#b5e4f4"
        shape_block: "#01a0e4"
        shape_filepath: "#b5e4f4"
        shape_globpattern: "#b5e4f4"
        shape_variable: "#a16a94"
        shape_flag: "#01a0e4"
        shape_custom: "#01a252"
        shape_nothing: "#b5e4f4"
    }
}
