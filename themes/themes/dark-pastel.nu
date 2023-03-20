export def main [] {
    # extra desired values for the dark_pastel theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#ffffff"
    # cursor: "#ffffff"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#55ff55"
        empty: "#5555ff"
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
        row_index: "#55ff55"
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
        shape_range: "#ffff55"
        shape_internalcall: "#55ffff"
        shape_external: "#55ffff"
        shape_externalarg: "#55ff55"
        shape_literal: "#5555ff"
        shape_operator: "#ffff55"
        shape_signature: "#55ff55"
        shape_string: "#55ff55"
        shape_string_interpolation: "#55ffff"
        shape_datetime: "#55ffff"
        shape_list: "#55ffff"
        shape_table: "#5555ff"
        shape_record: "#55ffff"
        shape_block: "#5555ff"
        shape_filepath: "#55ffff"
        shape_globpattern: "#55ffff"
        shape_variable: "#ff55ff"
        shape_flag: "#5555ff"
        shape_custom: "#55ff55"
        shape_nothing: "#55ffff"
    }
}
