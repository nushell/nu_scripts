export def main [] {
    # extra desired values for the icy theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#021012"
    # foreground: "#095b67"
    # cursor: "#095b67"

    {
        # color for nushell primitives
        separator: "#109cb0"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#4dd0e1"
        empty: "#00bcd4"
        bool: "#109cb0"
        int: "#109cb0"
        filesize: "#109cb0"
        duration: "#109cb0"
        date: "#109cb0"
        range: "#109cb0"
        float: "#109cb0"
        string: "#109cb0"
        nothing: "#109cb0"
        binary: "#109cb0"
        cellpath: "#109cb0"
        row_index: "#4dd0e1"
        record: "#109cb0"
        list: "#109cb0"
        block: "#109cb0"
        hints: "#052e34"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#00acc1"
        shape_bool: "#26c6da"
        shape_int: "#00acc1"
        shape_float: "#00acc1"
        shape_range: "#80deea"
        shape_internalcall: "#26c6da"
        shape_external: "#26c6da"
        shape_externalarg: "#4dd0e1"
        shape_literal: "#00bcd4"
        shape_operator: "#80deea"
        shape_signature: "#4dd0e1"
        shape_string: "#4dd0e1"
        shape_string_interpolation: "#26c6da"
        shape_datetime: "#26c6da"
        shape_list: "#26c6da"
        shape_table: "#00bcd4"
        shape_record: "#26c6da"
        shape_block: "#00bcd4"
        shape_filepath: "#26c6da"
        shape_globpattern: "#26c6da"
        shape_variable: "#00acc1"
        shape_flag: "#00bcd4"
        shape_custom: "#4dd0e1"
        shape_nothing: "#26c6da"
    }
}
