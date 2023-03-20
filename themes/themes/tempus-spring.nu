export def main [] {
    # extra desired values for the tempus_spring theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#283a37"
    # foreground: "#b5b8b7"
    # cursor: "#b5b8b7"

    {
        # color for nushell primitives
        separator: "#b5b8b7"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#6dbb0d"
        empty: "#39b6ce"
        bool: "#b5b8b7"
        int: "#b5b8b7"
        filesize: "#b5b8b7"
        duration: "#b5b8b7"
        date: "#b5b8b7"
        range: "#b5b8b7"
        float: "#b5b8b7"
        string: "#b5b8b7"
        nothing: "#b5b8b7"
        binary: "#b5b8b7"
        cellpath: "#b5b8b7"
        row_index: "#6dbb0d"
        record: "#b5b8b7"
        list: "#b5b8b7"
        block: "#b5b8b7"
        hints: "#2a423d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d091db"
        shape_bool: "#3cbaa6"
        shape_int: "#d091db"
        shape_float: "#d091db"
        shape_range: "#c5a443"
        shape_internalcall: "#3cbaa6"
        shape_external: "#36bd84"
        shape_externalarg: "#6dbb0d"
        shape_literal: "#39b6ce"
        shape_operator: "#a6af1a"
        shape_signature: "#6dbb0d"
        shape_string: "#5cbc4d"
        shape_string_interpolation: "#3cbaa6"
        shape_datetime: "#3cbaa6"
        shape_list: "#3cbaa6"
        shape_table: "#70ade2"
        shape_record: "#3cbaa6"
        shape_block: "#70ade2"
        shape_filepath: "#36bd84"
        shape_globpattern: "#3cbaa6"
        shape_variable: "#e69092"
        shape_flag: "#70ade2"
        shape_custom: "#5cbc4d"
        shape_nothing: "#3cbaa6"
    }
}
