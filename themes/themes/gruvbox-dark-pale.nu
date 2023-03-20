export def main [] {
    # extra desired values for the gruvbox_dark-pale theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#262626"
    # foreground: "#dab997"
    # cursor: "#dab997"

    {
        # color for nushell primitives
        separator: "#ebdbb2"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#afaf00"
        empty: "#83adad"
        bool: "#ebdbb2"
        int: "#ebdbb2"
        filesize: "#ebdbb2"
        duration: "#ebdbb2"
        date: "#ebdbb2"
        range: "#ebdbb2"
        float: "#ebdbb2"
        string: "#ebdbb2"
        nothing: "#ebdbb2"
        binary: "#ebdbb2"
        cellpath: "#ebdbb2"
        row_index: "#afaf00"
        record: "#ebdbb2"
        list: "#ebdbb2"
        block: "#ebdbb2"
        hints: "#8a8a8a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d485ad"
        shape_bool: "#85ad85"
        shape_int: "#d485ad"
        shape_float: "#d485ad"
        shape_range: "#ffaf00"
        shape_internalcall: "#85ad85"
        shape_external: "#85ad85"
        shape_externalarg: "#afaf00"
        shape_literal: "#83adad"
        shape_operator: "#ffaf00"
        shape_signature: "#afaf00"
        shape_string: "#afaf00"
        shape_string_interpolation: "#85ad85"
        shape_datetime: "#85ad85"
        shape_list: "#85ad85"
        shape_table: "#83adad"
        shape_record: "#85ad85"
        shape_block: "#83adad"
        shape_filepath: "#85ad85"
        shape_globpattern: "#85ad85"
        shape_variable: "#d485ad"
        shape_flag: "#83adad"
        shape_custom: "#afaf00"
        shape_nothing: "#85ad85"
    }
}
