export def main [] {
    # extra desired values for the goa_base theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2f0033"
    # foreground: "#f6ed00"
    # cursor: "#1a6500"

    {
        # color for nushell primitives
        separator: "#f5f4fb"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#5743ff"
        empty: "#000482"
        bool: "#f5f4fb"
        int: "#f5f4fb"
        filesize: "#f5f4fb"
        duration: "#f5f4fb"
        date: "#f5f4fb"
        range: "#f5f4fb"
        float: "#f5f4fb"
        string: "#f5f4fb"
        nothing: "#f5f4fb"
        binary: "#f5f4fb"
        cellpath: "#f5f4fb"
        row_index: "#5743ff"
        record: "#f5f4fb"
        list: "#f5f4fb"
        block: "#f5f4fb"
        hints: "#411a6d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9a5952"
        shape_bool: "#c8f9f3"
        shape_int: "#9a5952"
        shape_float: "#9a5952"
        shape_range: "#ea00d7"
        shape_internalcall: "#c8f9f3"
        shape_external: "#3affff"
        shape_externalarg: "#5743ff"
        shape_literal: "#000482"
        shape_operator: "#f40000"
        shape_signature: "#5743ff"
        shape_string: "#249000"
        shape_string_interpolation: "#c8f9f3"
        shape_datetime: "#c8f9f3"
        shape_list: "#c8f9f3"
        shape_table: "#b90003"
        shape_record: "#c8f9f3"
        shape_block: "#b90003"
        shape_filepath: "#3affff"
        shape_globpattern: "#c8f9f3"
        shape_variable: "#f43bff"
        shape_flag: "#b90003"
        shape_custom: "#249000"
        shape_nothing: "#c8f9f3"
    }
}
