export def main [] {
    # extra desired values for the ollie theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#222125"
    # foreground: "#8a8dae"
    # cursor: "#8a8dae"

    {
        # color for nushell primitives
        separator: "#5b6ea7"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#3bff99"
        empty: "#2d57ac"
        bool: "#5b6ea7"
        int: "#5b6ea7"
        filesize: "#5b6ea7"
        duration: "#5b6ea7"
        date: "#5b6ea7"
        range: "#5b6ea7"
        float: "#5b6ea7"
        string: "#5b6ea7"
        nothing: "#5b6ea7"
        binary: "#5b6ea7"
        cellpath: "#5b6ea7"
        row_index: "#3bff99"
        record: "#5b6ea7"
        list: "#5b6ea7"
        block: "#5b6ea7"
        hints: "#5b3725"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ffc21d"
        shape_bool: "#1ffaff"
        shape_int: "#ffc21d"
        shape_float: "#ffc21d"
        shape_range: "#ff5e1e"
        shape_internalcall: "#1ffaff"
        shape_external: "#1fa6ac"
        shape_externalarg: "#3bff99"
        shape_literal: "#2d57ac"
        shape_operator: "#ac4300"
        shape_signature: "#3bff99"
        shape_string: "#31ac61"
        shape_string_interpolation: "#1ffaff"
        shape_datetime: "#1ffaff"
        shape_list: "#1ffaff"
        shape_table: "#4488ff"
        shape_record: "#1ffaff"
        shape_block: "#4488ff"
        shape_filepath: "#1fa6ac"
        shape_globpattern: "#1ffaff"
        shape_variable: "#b08528"
        shape_flag: "#4488ff"
        shape_custom: "#31ac61"
        shape_nothing: "#1ffaff"
    }
}
