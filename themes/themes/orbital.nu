export def main [] {
    # extra desired values for the orbital theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#e4e4e4"
    # cursor: "#5fafff"

    {
        # color for nushell primitives
        separator: "#0000d7"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#ffd7af"
        empty: "#5f87d7"
        bool: "#0000d7"
        int: "#0000d7"
        filesize: "#0000d7"
        duration: "#0000d7"
        date: "#0000d7"
        range: "#0000d7"
        float: "#0000d7"
        string: "#0000d7"
        nothing: "#0000d7"
        binary: "#0000d7"
        cellpath: "#0000d7"
        row_index: "#ffd7af"
        record: "#0000d7"
        list: "#0000d7"
        block: "#0000d7"
        hints: "#262626"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#5fafff"
        shape_bool: "#005faf"
        shape_int: "#5fafff"
        shape_float: "#5fafff"
        shape_range: "#af875f"
        shape_internalcall: "#005faf"
        shape_external: "#0087d7"
        shape_externalarg: "#ffd7af"
        shape_literal: "#5f87d7"
        shape_operator: "#d7af87"
        shape_signature: "#ffd7af"
        shape_string: "#bcbcbc"
        shape_string_interpolation: "#005faf"
        shape_datetime: "#005faf"
        shape_list: "#005faf"
        shape_table: "#5f87af"
        shape_record: "#005faf"
        shape_block: "#5f87af"
        shape_filepath: "#0087d7"
        shape_globpattern: "#005faf"
        shape_variable: "#87afd7"
        shape_flag: "#5f87af"
        shape_custom: "#bcbcbc"
        shape_nothing: "#005faf"
    }
}
