export def main [] {
    # extra desired values for the summerfruit_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#151515"
    # foreground: "#d0d0d0"
    # cursor: "#d0d0d0"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#00c918"
        empty: "#3777e6"
        bool: "#ffffff"
        int: "#ffffff"
        filesize: "#ffffff"
        duration: "#ffffff"
        date: "#ffffff"
        range: "#ffffff"
        float: "#ffffff"
        string: "#ffffff"
        nothing: "#ffffff"
        binary: "#ffffff"
        cellpath: "#ffffff"
        row_index: "#00c918"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#505050"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ad00a1"
        shape_bool: "#1faaaa"
        shape_int: "#ad00a1"
        shape_float: "#ad00a1"
        shape_range: "#aba800"
        shape_internalcall: "#1faaaa"
        shape_external: "#1faaaa"
        shape_externalarg: "#00c918"
        shape_literal: "#3777e6"
        shape_operator: "#aba800"
        shape_signature: "#00c918"
        shape_string: "#00c918"
        shape_string_interpolation: "#1faaaa"
        shape_datetime: "#1faaaa"
        shape_list: "#1faaaa"
        shape_table: "#3777e6"
        shape_record: "#1faaaa"
        shape_block: "#3777e6"
        shape_filepath: "#1faaaa"
        shape_globpattern: "#1faaaa"
        shape_variable: "#ad00a1"
        shape_flag: "#3777e6"
        shape_custom: "#00c918"
        shape_nothing: "#1faaaa"
    }
}
