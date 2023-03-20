export def main [] {
    # extra desired values for the tango_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ffffff"
    # foreground: "#000000"
    # cursor: "#000000"

    {
        # color for nushell primitives
        separator: "#ededec"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8ae234"
        empty: "#3464a4"
        bool: "#ededec"
        int: "#ededec"
        filesize: "#ededec"
        duration: "#ededec"
        date: "#ededec"
        range: "#ededec"
        float: "#ededec"
        string: "#ededec"
        nothing: "#ededec"
        binary: "#ededec"
        cellpath: "#ededec"
        row_index: "#8ae234"
        record: "#ededec"
        list: "#ededec"
        block: "#ededec"
        hints: "#545753"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ad7ea7"
        shape_bool: "#34e2e2"
        shape_int: "#ad7ea7"
        shape_float: "#ad7ea7"
        shape_range: "#fce94e"
        shape_internalcall: "#34e2e2"
        shape_external: "#05989a"
        shape_externalarg: "#8ae234"
        shape_literal: "#3464a4"
        shape_operator: "#c4a000"
        shape_signature: "#8ae234"
        shape_string: "#4e9a05"
        shape_string_interpolation: "#34e2e2"
        shape_datetime: "#34e2e2"
        shape_list: "#34e2e2"
        shape_table: "#719ecf"
        shape_record: "#34e2e2"
        shape_block: "#719ecf"
        shape_filepath: "#05989a"
        shape_globpattern: "#34e2e2"
        shape_variable: "#74507a"
        shape_flag: "#719ecf"
        shape_custom: "#4e9a05"
        shape_nothing: "#34e2e2"
    }
}
