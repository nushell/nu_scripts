export def main [] {
    # extra desired values for the edge_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#fafafa"
    # foreground: "#5e646f"
    # cursor: "#5e646f"

    {
        # color for nushell primitives
        separator: "#5e646f"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7c9f4b"
        empty: "#6587bf"
        bool: "#5e646f"
        int: "#5e646f"
        filesize: "#5e646f"
        duration: "#5e646f"
        date: "#5e646f"
        range: "#5e646f"
        float: "#5e646f"
        string: "#5e646f"
        nothing: "#5e646f"
        binary: "#5e646f"
        cellpath: "#5e646f"
        row_index: "#7c9f4b"
        record: "#5e646f"
        list: "#5e646f"
        block: "#5e646f"
        hints: "#5e646f"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b870ce"
        shape_bool: "#509c93"
        shape_int: "#b870ce"
        shape_float: "#b870ce"
        shape_range: "#d69822"
        shape_internalcall: "#509c93"
        shape_external: "#509c93"
        shape_externalarg: "#7c9f4b"
        shape_literal: "#6587bf"
        shape_operator: "#d69822"
        shape_signature: "#7c9f4b"
        shape_string: "#7c9f4b"
        shape_string_interpolation: "#509c93"
        shape_datetime: "#509c93"
        shape_list: "#509c93"
        shape_table: "#6587bf"
        shape_record: "#509c93"
        shape_block: "#6587bf"
        shape_filepath: "#509c93"
        shape_globpattern: "#509c93"
        shape_variable: "#b870ce"
        shape_flag: "#6587bf"
        shape_custom: "#7c9f4b"
        shape_nothing: "#509c93"
    }
}
