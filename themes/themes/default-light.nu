export def main [] {
    # extra desired values for the default_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f8f8f8"
    # foreground: "#383838"
    # cursor: "#383838"

    {
        # color for nushell primitives
        separator: "#181818"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a1b56c"
        empty: "#7cafc2"
        bool: "#181818"
        int: "#181818"
        filesize: "#181818"
        duration: "#181818"
        date: "#181818"
        range: "#181818"
        float: "#181818"
        string: "#181818"
        nothing: "#181818"
        binary: "#181818"
        cellpath: "#181818"
        row_index: "#a1b56c"
        record: "#181818"
        list: "#181818"
        block: "#181818"
        hints: "#b8b8b8"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ba8baf"
        shape_bool: "#86c1b9"
        shape_int: "#ba8baf"
        shape_float: "#ba8baf"
        shape_range: "#f7ca88"
        shape_internalcall: "#86c1b9"
        shape_external: "#86c1b9"
        shape_externalarg: "#a1b56c"
        shape_literal: "#7cafc2"
        shape_operator: "#f7ca88"
        shape_signature: "#a1b56c"
        shape_string: "#a1b56c"
        shape_string_interpolation: "#86c1b9"
        shape_datetime: "#86c1b9"
        shape_list: "#86c1b9"
        shape_table: "#7cafc2"
        shape_record: "#86c1b9"
        shape_block: "#7cafc2"
        shape_filepath: "#86c1b9"
        shape_globpattern: "#86c1b9"
        shape_variable: "#ba8baf"
        shape_flag: "#7cafc2"
        shape_custom: "#a1b56c"
        shape_nothing: "#86c1b9"
    }
}
