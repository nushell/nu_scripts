export def main [] {
    # extra desired values for the silk_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0e3c46"
    # foreground: "#c7dbdd"
    # cursor: "#c7dbdd"

    {
        # color for nushell primitives
        separator: "#d2faff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#73d8ad"
        empty: "#46bddd"
        bool: "#d2faff"
        int: "#d2faff"
        filesize: "#d2faff"
        duration: "#d2faff"
        date: "#d2faff"
        range: "#d2faff"
        float: "#d2faff"
        string: "#d2faff"
        nothing: "#d2faff"
        binary: "#d2faff"
        cellpath: "#d2faff"
        row_index: "#73d8ad"
        record: "#d2faff"
        list: "#d2faff"
        block: "#d2faff"
        hints: "#587073"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#756b8a"
        shape_bool: "#3fb2b9"
        shape_int: "#756b8a"
        shape_float: "#756b8a"
        shape_range: "#fce380"
        shape_internalcall: "#3fb2b9"
        shape_external: "#3fb2b9"
        shape_externalarg: "#73d8ad"
        shape_literal: "#46bddd"
        shape_operator: "#fce380"
        shape_signature: "#73d8ad"
        shape_string: "#73d8ad"
        shape_string_interpolation: "#3fb2b9"
        shape_datetime: "#3fb2b9"
        shape_list: "#3fb2b9"
        shape_table: "#46bddd"
        shape_record: "#3fb2b9"
        shape_block: "#46bddd"
        shape_filepath: "#3fb2b9"
        shape_globpattern: "#3fb2b9"
        shape_variable: "#756b8a"
        shape_flag: "#46bddd"
        shape_custom: "#73d8ad"
        shape_nothing: "#3fb2b9"
    }
}
