export def main [] {
    # extra desired values for the tempus_warp theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#001514"
    # foreground: "#a29fa0"
    # cursor: "#a29fa0"

    {
        # color for nushell primitives
        separator: "#a29fa0"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#3aa73a"
        empty: "#557feb"
        bool: "#a29fa0"
        int: "#a29fa0"
        filesize: "#a29fa0"
        duration: "#a29fa0"
        date: "#a29fa0"
        range: "#a29fa0"
        float: "#a29fa0"
        string: "#a29fa0"
        nothing: "#a29fa0"
        binary: "#a29fa0"
        cellpath: "#a29fa0"
        row_index: "#3aa73a"
        record: "#a29fa0"
        list: "#a29fa0"
        block: "#a29fa0"
        hints: "#241828"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d85cf2"
        shape_bool: "#1da1af"
        shape_int: "#d85cf2"
        shape_float: "#d85cf2"
        shape_range: "#ba8a00"
        shape_internalcall: "#1da1af"
        shape_external: "#009580"
        shape_externalarg: "#3aa73a"
        shape_literal: "#557feb"
        shape_operator: "#9e8100"
        shape_signature: "#3aa73a"
        shape_string: "#139913"
        shape_string_interpolation: "#1da1af"
        shape_datetime: "#1da1af"
        shape_list: "#1da1af"
        shape_table: "#8887f0"
        shape_record: "#1da1af"
        shape_block: "#8887f0"
        shape_filepath: "#009580"
        shape_globpattern: "#1da1af"
        shape_variable: "#d54cbf"
        shape_flag: "#8887f0"
        shape_custom: "#139913"
        shape_nothing: "#1da1af"
    }
}
