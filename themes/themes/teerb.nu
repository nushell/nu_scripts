export def main [] {
    # extra desired values for the teerb theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#262626"
    # foreground: "#d0d0d0"
    # cursor: "#d0d0d0"

    {
        # color for nushell primitives
        separator: "#efefef"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#aed686"
        empty: "#86aed6"
        bool: "#efefef"
        int: "#efefef"
        filesize: "#efefef"
        duration: "#efefef"
        date: "#efefef"
        range: "#efefef"
        float: "#efefef"
        string: "#efefef"
        nothing: "#efefef"
        binary: "#efefef"
        cellpath: "#efefef"
        row_index: "#aed686"
        record: "#efefef"
        list: "#efefef"
        block: "#efefef"
        hints: "#1c1c1c"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d6aed6"
        shape_bool: "#b1e7dd"
        shape_int: "#d6aed6"
        shape_float: "#d6aed6"
        shape_range: "#e4c9af"
        shape_internalcall: "#b1e7dd"
        shape_external: "#8adbb4"
        shape_externalarg: "#aed686"
        shape_literal: "#86aed6"
        shape_operator: "#d7af87"
        shape_signature: "#aed686"
        shape_string: "#aed686"
        shape_string_interpolation: "#b1e7dd"
        shape_datetime: "#b1e7dd"
        shape_list: "#b1e7dd"
        shape_table: "#86aed6"
        shape_record: "#b1e7dd"
        shape_block: "#86aed6"
        shape_filepath: "#8adbb4"
        shape_globpattern: "#b1e7dd"
        shape_variable: "#d6aed6"
        shape_flag: "#86aed6"
        shape_custom: "#aed686"
        shape_nothing: "#b1e7dd"
    }
}
