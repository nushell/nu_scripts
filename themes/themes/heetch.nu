export def main [] {
    # extra desired values for the heetch theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#190134"
    # foreground: "#bdb6c5"
    # cursor: "#bdb6c5"

    {
        # color for nushell primitives
        separator: "#feffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#c33678"
        empty: "#bd0152"
        bool: "#feffff"
        int: "#feffff"
        filesize: "#feffff"
        duration: "#feffff"
        date: "#feffff"
        range: "#feffff"
        float: "#feffff"
        string: "#feffff"
        nothing: "#feffff"
        binary: "#feffff"
        cellpath: "#feffff"
        row_index: "#c33678"
        record: "#feffff"
        list: "#feffff"
        block: "#feffff"
        hints: "#7b6d8b"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#82034c"
        shape_bool: "#f80059"
        shape_int: "#82034c"
        shape_float: "#82034c"
        shape_range: "#8f6c97"
        shape_internalcall: "#f80059"
        shape_external: "#f80059"
        shape_externalarg: "#c33678"
        shape_literal: "#bd0152"
        shape_operator: "#8f6c97"
        shape_signature: "#c33678"
        shape_string: "#c33678"
        shape_string_interpolation: "#f80059"
        shape_datetime: "#f80059"
        shape_list: "#f80059"
        shape_table: "#bd0152"
        shape_record: "#f80059"
        shape_block: "#bd0152"
        shape_filepath: "#f80059"
        shape_globpattern: "#f80059"
        shape_variable: "#82034c"
        shape_flag: "#bd0152"
        shape_custom: "#c33678"
        shape_nothing: "#f80059"
    }
}
