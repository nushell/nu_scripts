export def main [] {
    # extra desired values for the summercamp theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1c1810"
    # foreground: "#736e55"
    # cursor: "#736e55"

    {
        # color for nushell primitives
        separator: "#f8f5de"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#5ceb5a"
        empty: "#489bf0"
        bool: "#f8f5de"
        int: "#f8f5de"
        filesize: "#f8f5de"
        duration: "#f8f5de"
        date: "#f8f5de"
        range: "#f8f5de"
        float: "#f8f5de"
        string: "#f8f5de"
        nothing: "#f8f5de"
        binary: "#f8f5de"
        cellpath: "#f8f5de"
        row_index: "#5ceb5a"
        record: "#f8f5de"
        list: "#f8f5de"
        block: "#f8f5de"
        hints: "#504b38"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff8080"
        shape_bool: "#5aebbc"
        shape_int: "#ff8080"
        shape_float: "#ff8080"
        shape_range: "#f2ff27"
        shape_internalcall: "#5aebbc"
        shape_external: "#5aebbc"
        shape_externalarg: "#5ceb5a"
        shape_literal: "#489bf0"
        shape_operator: "#f2ff27"
        shape_signature: "#5ceb5a"
        shape_string: "#5ceb5a"
        shape_string_interpolation: "#5aebbc"
        shape_datetime: "#5aebbc"
        shape_list: "#5aebbc"
        shape_table: "#489bf0"
        shape_record: "#5aebbc"
        shape_block: "#489bf0"
        shape_filepath: "#5aebbc"
        shape_globpattern: "#5aebbc"
        shape_variable: "#ff8080"
        shape_flag: "#489bf0"
        shape_custom: "#5ceb5a"
        shape_nothing: "#5aebbc"
    }
}
