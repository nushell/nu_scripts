export def main [] {
    # extra desired values for the atlas theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#002635"
    # foreground: "#a1a19a"
    # cursor: "#a1a19a"

    {
        # color for nushell primitives
        separator: "#fafaf8"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7fc06e"
        empty: "#5dd7b9"
        bool: "#fafaf8"
        int: "#fafaf8"
        filesize: "#fafaf8"
        duration: "#fafaf8"
        date: "#fafaf8"
        range: "#fafaf8"
        float: "#fafaf8"
        string: "#fafaf8"
        nothing: "#fafaf8"
        binary: "#fafaf8"
        cellpath: "#fafaf8"
        row_index: "#7fc06e"
        record: "#fafaf8"
        list: "#fafaf8"
        block: "#fafaf8"
        hints: "#6c8b91"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9a70a4"
        shape_bool: "#14747e"
        shape_int: "#9a70a4"
        shape_float: "#9a70a4"
        shape_range: "#ffcc1b"
        shape_internalcall: "#14747e"
        shape_external: "#14747e"
        shape_externalarg: "#7fc06e"
        shape_literal: "#5dd7b9"
        shape_operator: "#ffcc1b"
        shape_signature: "#7fc06e"
        shape_string: "#7fc06e"
        shape_string_interpolation: "#14747e"
        shape_datetime: "#14747e"
        shape_list: "#14747e"
        shape_table: "#5dd7b9"
        shape_record: "#14747e"
        shape_block: "#5dd7b9"
        shape_filepath: "#14747e"
        shape_globpattern: "#14747e"
        shape_variable: "#9a70a4"
        shape_flag: "#5dd7b9"
        shape_custom: "#7fc06e"
        shape_nothing: "#14747e"
    }
}
