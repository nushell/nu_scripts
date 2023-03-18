export def main [] {
    # extra desired values for the 3024_night theme
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
        header: "#3a3432"
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
        row_index: "#3a3432"
        record: "#f7f7f7"
        list: "#f7f7f7"
        block: "#f7f7f7"
        hints: "#5c5855"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d6d5d4"
        shape_bool: "#cdab53"
        shape_int: "#d6d5d4"
        shape_float: "#d6d5d4"
        shape_range: "#4a4543"
        shape_internalcall: "#cdab53"
        shape_external: "#b5e4f4"
        shape_externalarg: "#3a3432"
        shape_literal: "#01a0e4"
        shape_operator: "#fded02"
        shape_signature: "#3a3432"
        shape_string: "#01a252"
        shape_string_interpolation: "#cdab53"
        shape_datetime: "#cdab53"
        shape_list: "#cdab53"
        shape_table: "#807d7c"
        shape_record: "#cdab53"
        shape_block: "#807d7c"
        shape_filepath: "#b5e4f4"
        shape_globpattern: "#cdab53"
        shape_variable: "#a16a94"
        shape_flag: "#807d7c"
        shape_custom: "#01a252"
        shape_nothing: "#cdab53"
    }
}
