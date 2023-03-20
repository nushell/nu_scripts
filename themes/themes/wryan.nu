export def main [] {
    # extra desired values for the wryan theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#101010"
    # foreground: "#999993"
    # cursor: "#999993"

    {
        # color for nushell primitives
        separator: "#c0c0c0"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#53a6a6"
        empty: "#395573"
        bool: "#c0c0c0"
        int: "#c0c0c0"
        filesize: "#c0c0c0"
        duration: "#c0c0c0"
        date: "#c0c0c0"
        range: "#c0c0c0"
        float: "#c0c0c0"
        string: "#c0c0c0"
        nothing: "#c0c0c0"
        binary: "#c0c0c0"
        cellpath: "#c0c0c0"
        row_index: "#53a6a6"
        record: "#c0c0c0"
        list: "#c0c0c0"
        block: "#c0c0c0"
        hints: "#3d3d3d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#7e62b3"
        shape_bool: "#6096bf"
        shape_int: "#7e62b3"
        shape_float: "#7e62b3"
        shape_range: "#9e9ecb"
        shape_internalcall: "#6096bf"
        shape_external: "#31658c"
        shape_externalarg: "#53a6a6"
        shape_literal: "#395573"
        shape_operator: "#7c7c99"
        shape_signature: "#53a6a6"
        shape_string: "#287373"
        shape_string_interpolation: "#6096bf"
        shape_datetime: "#6096bf"
        shape_list: "#6096bf"
        shape_table: "#477ab3"
        shape_record: "#6096bf"
        shape_block: "#477ab3"
        shape_filepath: "#31658c"
        shape_globpattern: "#6096bf"
        shape_variable: "#5e468c"
        shape_flag: "#477ab3"
        shape_custom: "#287373"
        shape_nothing: "#6096bf"
    }
}
