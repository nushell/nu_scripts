export def main [] {
    # extra desired values for the adventuretime theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1f1d45"
    # foreground: "#f8dcc0"
    # cursor: "#f8dcc0"

    {
        # color for nushell primitives
        separator: "#f6f5fb"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#9eff6e"
        empty: "#0f4ac6"
        bool: "#f6f5fb"
        int: "#f6f5fb"
        filesize: "#f6f5fb"
        duration: "#f6f5fb"
        date: "#f6f5fb"
        range: "#f6f5fb"
        float: "#f6f5fb"
        string: "#f6f5fb"
        nothing: "#f6f5fb"
        binary: "#f6f5fb"
        cellpath: "#f6f5fb"
        row_index: "#9eff6e"
        record: "#f6f5fb"
        list: "#f6f5fb"
        block: "#f6f5fb"
        hints: "#4e7cbf"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9b5953"
        shape_bool: "#c8faf4"
        shape_int: "#9b5953"
        shape_float: "#9b5953"
        shape_range: "#efc11a"
        shape_internalcall: "#c8faf4"
        shape_external: "#70a598"
        shape_externalarg: "#9eff6e"
        shape_literal: "#0f4ac6"
        shape_operator: "#e7741e"
        shape_signature: "#9eff6e"
        shape_string: "#4ab118"
        shape_string_interpolation: "#c8faf4"
        shape_datetime: "#c8faf4"
        shape_list: "#c8faf4"
        shape_table: "#1997c6"
        shape_record: "#c8faf4"
        shape_block: "#1997c6"
        shape_filepath: "#70a598"
        shape_globpattern: "#c8faf4"
        shape_variable: "#665993"
        shape_flag: "#1997c6"
        shape_custom: "#4ab118"
        shape_nothing: "#c8faf4"
    }
}
