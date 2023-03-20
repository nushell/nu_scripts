export def main [] {
    # extra desired values for the atelier_savanna theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#171c19"
    # foreground: "#87928a"
    # cursor: "#87928a"

    {
        # color for nushell primitives
        separator: "#ecf4ee"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#489963"
        empty: "#478c90"
        bool: "#ecf4ee"
        int: "#ecf4ee"
        filesize: "#ecf4ee"
        duration: "#ecf4ee"
        date: "#ecf4ee"
        range: "#ecf4ee"
        float: "#ecf4ee"
        string: "#ecf4ee"
        nothing: "#ecf4ee"
        binary: "#ecf4ee"
        cellpath: "#ecf4ee"
        row_index: "#489963"
        record: "#ecf4ee"
        list: "#ecf4ee"
        block: "#ecf4ee"
        hints: "#5f6d64"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#55859b"
        shape_bool: "#1c9aa0"
        shape_int: "#55859b"
        shape_float: "#55859b"
        shape_range: "#a07e3b"
        shape_internalcall: "#1c9aa0"
        shape_external: "#1c9aa0"
        shape_externalarg: "#489963"
        shape_literal: "#478c90"
        shape_operator: "#a07e3b"
        shape_signature: "#489963"
        shape_string: "#489963"
        shape_string_interpolation: "#1c9aa0"
        shape_datetime: "#1c9aa0"
        shape_list: "#1c9aa0"
        shape_table: "#478c90"
        shape_record: "#1c9aa0"
        shape_block: "#478c90"
        shape_filepath: "#1c9aa0"
        shape_globpattern: "#1c9aa0"
        shape_variable: "#55859b"
        shape_flag: "#478c90"
        shape_custom: "#489963"
        shape_nothing: "#1c9aa0"
    }
}
