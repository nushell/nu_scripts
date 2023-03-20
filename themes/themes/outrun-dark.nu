export def main [] {
    # extra desired values for the outrun_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#00002a"
    # foreground: "#d0d0fa"
    # cursor: "#d0d0fa"

    {
        # color for nushell primitives
        separator: "#f5f5ff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#59f176"
        empty: "#66b0ff"
        bool: "#f5f5ff"
        int: "#f5f5ff"
        filesize: "#f5f5ff"
        duration: "#f5f5ff"
        date: "#f5f5ff"
        range: "#f5f5ff"
        float: "#f5f5ff"
        string: "#f5f5ff"
        nothing: "#f5f5ff"
        binary: "#f5f5ff"
        cellpath: "#f5f5ff"
        row_index: "#59f176"
        record: "#f5f5ff"
        list: "#f5f5ff"
        block: "#f5f5ff"
        hints: "#50507a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#f10596"
        shape_bool: "#0ef0f0"
        shape_int: "#f10596"
        shape_float: "#f10596"
        shape_range: "#f3e877"
        shape_internalcall: "#0ef0f0"
        shape_external: "#0ef0f0"
        shape_externalarg: "#59f176"
        shape_literal: "#66b0ff"
        shape_operator: "#f3e877"
        shape_signature: "#59f176"
        shape_string: "#59f176"
        shape_string_interpolation: "#0ef0f0"
        shape_datetime: "#0ef0f0"
        shape_list: "#0ef0f0"
        shape_table: "#66b0ff"
        shape_record: "#0ef0f0"
        shape_block: "#66b0ff"
        shape_filepath: "#0ef0f0"
        shape_globpattern: "#0ef0f0"
        shape_variable: "#f10596"
        shape_flag: "#66b0ff"
        shape_custom: "#59f176"
        shape_nothing: "#0ef0f0"
    }
}
