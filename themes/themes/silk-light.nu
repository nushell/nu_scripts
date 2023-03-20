export def main [] {
    # extra desired values for the silk_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#e9f1ef"
    # foreground: "#385156"
    # cursor: "#385156"

    {
        # color for nushell primitives
        separator: "#d2faff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#6ca38c"
        empty: "#39aac9"
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
        row_index: "#6ca38c"
        record: "#d2faff"
        list: "#d2faff"
        block: "#d2faff"
        hints: "#5c787b"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#6e6582"
        shape_bool: "#329ca2"
        shape_int: "#6e6582"
        shape_float: "#6e6582"
        shape_range: "#cfad25"
        shape_internalcall: "#329ca2"
        shape_external: "#329ca2"
        shape_externalarg: "#6ca38c"
        shape_literal: "#39aac9"
        shape_operator: "#cfad25"
        shape_signature: "#6ca38c"
        shape_string: "#6ca38c"
        shape_string_interpolation: "#329ca2"
        shape_datetime: "#329ca2"
        shape_list: "#329ca2"
        shape_table: "#39aac9"
        shape_record: "#329ca2"
        shape_block: "#39aac9"
        shape_filepath: "#329ca2"
        shape_globpattern: "#329ca2"
        shape_variable: "#6e6582"
        shape_flag: "#39aac9"
        shape_custom: "#6ca38c"
        shape_nothing: "#329ca2"
    }
}
