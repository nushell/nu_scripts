export def main [] {
    # extra desired values for the bright_lights theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#191919"
    # foreground: "#b2c8d6"
    # cursor: "#f34a00"

    {
        # color for nushell primitives
        separator: "#c1c8d6"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b6e875"
        empty: "#75d3ff"
        bool: "#c1c8d6"
        int: "#c1c8d6"
        filesize: "#c1c8d6"
        duration: "#c1c8d6"
        date: "#c1c8d6"
        range: "#c1c8d6"
        float: "#c1c8d6"
        string: "#c1c8d6"
        nothing: "#c1c8d6"
        binary: "#c1c8d6"
        cellpath: "#c1c8d6"
        row_index: "#b6e875"
        record: "#c1c8d6"
        list: "#c1c8d6"
        block: "#c1c8d6"
        hints: "#191919"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b975e6"
        shape_bool: "#6cbeb5"
        shape_int: "#b975e6"
        shape_float: "#b975e6"
        shape_range: "#ffc150"
        shape_internalcall: "#6cbeb5"
        shape_external: "#6cbeb5"
        shape_externalarg: "#b6e875"
        shape_literal: "#75d3ff"
        shape_operator: "#ffc150"
        shape_signature: "#b6e875"
        shape_string: "#b6e875"
        shape_string_interpolation: "#6cbeb5"
        shape_datetime: "#6cbeb5"
        shape_list: "#6cbeb5"
        shape_table: "#75d4ff"
        shape_record: "#6cbeb5"
        shape_block: "#75d4ff"
        shape_filepath: "#6cbeb5"
        shape_globpattern: "#6cbeb5"
        shape_variable: "#b975e6"
        shape_flag: "#75d4ff"
        shape_custom: "#b6e875"
        shape_nothing: "#6cbeb5"
    }
}
