export def main [] {
    # extra desired values for the tomorrow_night-blue theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#002451"
    # foreground: "#fffefe"
    # cursor: "#fffefe"

    {
        # color for nushell primitives
        separator: "#fffefe"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#d0f0a8"
        empty: "#bbdaff"
        bool: "#fffefe"
        int: "#fffefe"
        filesize: "#fffefe"
        duration: "#fffefe"
        date: "#fffefe"
        range: "#fffefe"
        float: "#fffefe"
        string: "#fffefe"
        nothing: "#fffefe"
        binary: "#fffefe"
        cellpath: "#fffefe"
        row_index: "#d0f0a8"
        record: "#fffefe"
        list: "#fffefe"
        block: "#fffefe"
        hints: "#000000"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ebbaff"
        shape_bool: "#99ffff"
        shape_int: "#ebbaff"
        shape_float: "#ebbaff"
        shape_range: "#ffedac"
        shape_internalcall: "#99ffff"
        shape_external: "#99ffff"
        shape_externalarg: "#d0f0a8"
        shape_literal: "#bbdaff"
        shape_operator: "#ffeead"
        shape_signature: "#d0f0a8"
        shape_string: "#d1f1a9"
        shape_string_interpolation: "#99ffff"
        shape_datetime: "#99ffff"
        shape_list: "#99ffff"
        shape_table: "#badaff"
        shape_record: "#99ffff"
        shape_block: "#badaff"
        shape_filepath: "#99ffff"
        shape_globpattern: "#99ffff"
        shape_variable: "#ebbbff"
        shape_flag: "#badaff"
        shape_custom: "#d1f1a9"
        shape_nothing: "#99ffff"
    }
}
