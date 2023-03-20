export def main [] {
    # extra desired values for the obsidian theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#283033"
    # foreground: "#cdcdcd"
    # cursor: "#cdcdcd"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#93c863"
        empty: "#3a9bdb"
        bool: "#ffffff"
        int: "#ffffff"
        filesize: "#ffffff"
        duration: "#ffffff"
        date: "#ffffff"
        range: "#ffffff"
        float: "#ffffff"
        string: "#ffffff"
        nothing: "#ffffff"
        binary: "#ffffff"
        cellpath: "#ffffff"
        row_index: "#93c863"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#555555"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff55ff"
        shape_bool: "#55ffff"
        shape_int: "#ff55ff"
        shape_float: "#ff55ff"
        shape_range: "#fef874"
        shape_internalcall: "#55ffff"
        shape_external: "#00bbbb"
        shape_externalarg: "#93c863"
        shape_literal: "#3a9bdb"
        shape_operator: "#fecd22"
        shape_signature: "#93c863"
        shape_string: "#00bb00"
        shape_string_interpolation: "#55ffff"
        shape_datetime: "#55ffff"
        shape_list: "#55ffff"
        shape_table: "#a1d7ff"
        shape_record: "#55ffff"
        shape_block: "#a1d7ff"
        shape_filepath: "#00bbbb"
        shape_globpattern: "#55ffff"
        shape_variable: "#bb00bb"
        shape_flag: "#a1d7ff"
        shape_custom: "#00bb00"
        shape_nothing: "#55ffff"
    }
}
