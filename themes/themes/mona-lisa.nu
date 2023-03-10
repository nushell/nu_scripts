export def main [] {
    # extra desired values for the mona_lisa theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#120b0d"
    # foreground: "#f7d66a"
    # cursor: "#f7d66a"

    {
        # color for nushell primitives
        separator: "#ffe598"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b4b264"
        empty: "#515c5d"
        bool: "#ffe598"
        int: "#ffe598"
        filesize: "#ffe598"
        duration: "#ffe598"
        date: "#ffe598"
        range: "#ffe598"
        float: "#ffe598"
        string: "#ffe598"
        nothing: "#ffe598"
        binary: "#ffe598"
        cellpath: "#ffe598"
        row_index: "#b4b264"
        record: "#ffe598"
        list: "#ffe598"
        block: "#ffe598"
        hints: "#874228"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff5b6a"
        shape_bool: "#8acd8f"
        shape_int: "#ff5b6a"
        shape_float: "#ff5b6a"
        shape_range: "#ff9566"
        shape_internalcall: "#8acd8f"
        shape_external: "#588056"
        shape_externalarg: "#b4b264"
        shape_literal: "#515c5d"
        shape_operator: "#c36e28"
        shape_signature: "#b4b264"
        shape_string: "#636232"
        shape_string_interpolation: "#8acd8f"
        shape_datetime: "#8acd8f"
        shape_list: "#8acd8f"
        shape_table: "#9eb2b4"
        shape_record: "#8acd8f"
        shape_block: "#9eb2b4"
        shape_filepath: "#588056"
        shape_globpattern: "#8acd8f"
        shape_variable: "#9b1d29"
        shape_flag: "#9eb2b4"
        shape_custom: "#636232"
        shape_nothing: "#8acd8f"
    }
}
