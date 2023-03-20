export def main [] {
    # extra desired values for the terminix_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#091116"
    # foreground: "#868a8c"
    # cursor: "#868a8c"

    {
        # color for nushell primitives
        separator: "#c5c8c6"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#608360"
        empty: "#225555"
        bool: "#c5c8c6"
        int: "#c5c8c6"
        filesize: "#c5c8c6"
        duration: "#c5c8c6"
        date: "#c5c8c6"
        range: "#c5c8c6"
        float: "#c5c8c6"
        string: "#c5c8c6"
        nothing: "#c5c8c6"
        binary: "#c5c8c6"
        cellpath: "#c5c8c6"
        row_index: "#608360"
        record: "#c5c8c6"
        list: "#c5c8c6"
        block: "#c5c8c6"
        hints: "#373b41"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ba8baf"
        shape_bool: "#86c1b9"
        shape_int: "#ba8baf"
        shape_float: "#ba8baf"
        shape_range: "#fa805a"
        shape_internalcall: "#86c1b9"
        shape_external: "#5e8d87"
        shape_externalarg: "#608360"
        shape_literal: "#225555"
        shape_operator: "#de935f"
        shape_signature: "#608360"
        shape_string: "#a1b56c"
        shape_string_interpolation: "#86c1b9"
        shape_datetime: "#86c1b9"
        shape_list: "#86c1b9"
        shape_table: "#449da1"
        shape_record: "#86c1b9"
        shape_block: "#449da1"
        shape_filepath: "#5e8d87"
        shape_globpattern: "#86c1b9"
        shape_variable: "#85678f"
        shape_flag: "#449da1"
        shape_custom: "#a1b56c"
        shape_nothing: "#86c1b9"
    }
}
