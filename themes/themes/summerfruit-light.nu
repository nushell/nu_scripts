export def main [] {
    # extra desired values for the summerfruit_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ffffff"
    # foreground: "#101010"
    # cursor: "#101010"

    {
        # color for nushell primitives
        separator: "#202020"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#00c918"
        empty: "#3777e6"
        bool: "#202020"
        int: "#202020"
        filesize: "#202020"
        duration: "#202020"
        date: "#202020"
        range: "#202020"
        float: "#202020"
        string: "#202020"
        nothing: "#202020"
        binary: "#202020"
        cellpath: "#202020"
        row_index: "#00c918"
        record: "#202020"
        list: "#202020"
        block: "#202020"
        hints: "#b0b0b0"

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
