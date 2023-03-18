export def main [] {
    # extra desired values for the heetch_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#feffff"
    # foreground: "#5a496e"
    # cursor: "#5a496e"

    {
        # color for nushell primitives
        separator: "#190134"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#f80059"
        empty: "#47f9f5"
        bool: "#190134"
        int: "#190134"
        filesize: "#190134"
        duration: "#190134"
        date: "#190134"
        range: "#190134"
        float: "#190134"
        string: "#190134"
        nothing: "#190134"
        binary: "#190134"
        cellpath: "#190134"
        row_index: "#f80059"
        record: "#190134"
        list: "#190134"
        block: "#190134"
        hints: "#9c92a8"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#bd0152"
        shape_bool: "#c33678"
        shape_int: "#bd0152"
        shape_float: "#bd0152"
        shape_range: "#5ba2b6"
        shape_internalcall: "#c33678"
        shape_external: "#c33678"
        shape_externalarg: "#f80059"
        shape_literal: "#47f9f5"
        shape_operator: "#5ba2b6"
        shape_signature: "#f80059"
        shape_string: "#f80059"
        shape_string_interpolation: "#c33678"
        shape_datetime: "#c33678"
        shape_list: "#c33678"
        shape_table: "#47f9f5"
        shape_record: "#c33678"
        shape_block: "#47f9f5"
        shape_filepath: "#c33678"
        shape_globpattern: "#c33678"
        shape_variable: "#bd0152"
        shape_flag: "#47f9f5"
        shape_custom: "#f80059"
        shape_nothing: "#c33678"
    }
}
