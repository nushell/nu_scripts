export def main [] {
    # extra desired values for the wez theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#b3b3b3"
    # cursor: "#b3b3b3"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#55ff55"
        empty: "#5555cc"
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
        shape_external: "#7acaca"
        shape_externalarg: "#55ff55"
        shape_literal: "#5555cc"
        shape_operator: "#cdcd55"
        shape_signature: "#55ff55"
        shape_string: "#55cc55"
        shape_string_interpolation: "#55ffff"
        shape_datetime: "#55ffff"
        shape_list: "#55ffff"
        shape_table: "#5555ff"
        shape_record: "#55ffff"
        shape_block: "#5555ff"
        shape_filepath: "#7acaca"
        shape_globpattern: "#55ffff"
        shape_variable: "#cc55cc"
        shape_flag: "#5555ff"
        shape_custom: "#55cc55"
        shape_nothing: "#55ffff"
    }
}
