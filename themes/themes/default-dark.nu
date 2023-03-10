export def main [] {
    # extra desired values for the default_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#181818"
    # foreground: "#d8d8d8"
    # cursor: "#d8d8d8"

    {
        # color for nushell primitives
        separator: "#f8f8f8"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a1b56c"
        empty: "#7cafc2"
        bool: "#f8f8f8"
        int: "#f8f8f8"
        filesize: "#f8f8f8"
        duration: "#f8f8f8"
        date: "#f8f8f8"
        range: "#f8f8f8"
        float: "#f8f8f8"
        string: "#f8f8f8"
        nothing: "#f8f8f8"
        binary: "#f8f8f8"
        cellpath: "#f8f8f8"
        row_index: "#a1b56c"
        record: "#f8f8f8"
        list: "#f8f8f8"
        block: "#f8f8f8"
        hints: "#585858"

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
