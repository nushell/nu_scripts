export def main [] {
    # extra desired values for the seoul256 theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#3a3a3a"
    # foreground: "#d0d0d0"
    # cursor: "#d0d0d0"

    {
        # color for nushell primitives
        separator: "#e4e4e4"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#87af87"
        empty: "#85add4"
        bool: "#e4e4e4"
        int: "#e4e4e4"
        filesize: "#e4e4e4"
        duration: "#e4e4e4"
        date: "#e4e4e4"
        range: "#e4e4e4"
        float: "#e4e4e4"
        string: "#e4e4e4"
        nothing: "#e4e4e4"
        binary: "#e4e4e4"
        cellpath: "#e4e4e4"
        row_index: "#87af87"
        record: "#e4e4e4"
        list: "#e4e4e4"
        block: "#e4e4e4"
        hints: "#626262"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ffafaf"
        shape_bool: "#87d7d7"
        shape_int: "#ffafaf"
        shape_float: "#ffafaf"
        shape_range: "#ffd787"
        shape_internalcall: "#87d7d7"
        shape_external: "#87afaf"
        shape_externalarg: "#87af87"
        shape_literal: "#85add4"
        shape_operator: "#d8af5f"
        shape_signature: "#87af87"
        shape_string: "#5f865f"
        shape_string_interpolation: "#87d7d7"
        shape_datetime: "#87d7d7"
        shape_list: "#87d7d7"
        shape_table: "#add4fb"
        shape_record: "#87d7d7"
        shape_block: "#add4fb"
        shape_filepath: "#87afaf"
        shape_globpattern: "#87d7d7"
        shape_variable: "#d7afaf"
        shape_flag: "#add4fb"
        shape_custom: "#5f865f"
        shape_nothing: "#87d7d7"
    }
}
