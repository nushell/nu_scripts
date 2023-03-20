export def main [] {
    # extra desired values for the atelier_savanna-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ecf4ee"
    # foreground: "#526057"
    # cursor: "#526057"

    {
        # color for nushell primitives
        separator: "#171c19"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#489963"
        empty: "#478c90"
        bool: "#171c19"
        int: "#171c19"
        filesize: "#171c19"
        duration: "#171c19"
        date: "#171c19"
        range: "#171c19"
        float: "#171c19"
        string: "#171c19"
        nothing: "#171c19"
        binary: "#171c19"
        cellpath: "#171c19"
        row_index: "#489963"
        record: "#171c19"
        list: "#171c19"
        block: "#171c19"
        hints: "#78877d"

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
