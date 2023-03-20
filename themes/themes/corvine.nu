export def main [] {
    # extra desired values for the corvine theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#262626"
    # foreground: "#c6c6c6"
    # cursor: "#c6c6c6"

    {
        # color for nushell primitives
        separator: "#eeeeee"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#afd787"
        empty: "#87afd7"
        bool: "#eeeeee"
        int: "#eeeeee"
        filesize: "#eeeeee"
        duration: "#eeeeee"
        date: "#eeeeee"
        range: "#eeeeee"
        float: "#eeeeee"
        string: "#eeeeee"
        nothing: "#eeeeee"
        binary: "#eeeeee"
        cellpath: "#eeeeee"
        row_index: "#afd787"
        record: "#eeeeee"
        list: "#eeeeee"
        block: "#eeeeee"
        hints: "#626262"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d7afd7"
        shape_bool: "#5fd7d7"
        shape_int: "#d7afd7"
        shape_float: "#d7afd7"
        shape_range: "#d7d787"
        shape_internalcall: "#5fd7d7"
        shape_external: "#87d7d7"
        shape_externalarg: "#afd787"
        shape_literal: "#87afd7"
        shape_operator: "#d7d7af"
        shape_signature: "#afd787"
        shape_string: "#87af5f"
        shape_string_interpolation: "#5fd7d7"
        shape_datetime: "#5fd7d7"
        shape_list: "#5fd7d7"
        shape_table: "#87d7ff"
        shape_record: "#5fd7d7"
        shape_block: "#87d7ff"
        shape_filepath: "#87d7d7"
        shape_globpattern: "#5fd7d7"
        shape_variable: "#afafd7"
        shape_flag: "#87d7ff"
        shape_custom: "#87af5f"
        shape_nothing: "#5fd7d7"
    }
}
