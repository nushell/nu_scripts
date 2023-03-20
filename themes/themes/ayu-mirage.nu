export def main [] {
    # extra desired values for the ayu_mirage theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#212733"
    # foreground: "#d9d7ce"
    # cursor: "#ffcc66"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#bae67e"
        empty: "#6dcbfa"
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
        row_index: "#bae67e"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#686868"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d4bfff"
        shape_bool: "#95e6cb"
        shape_int: "#d4bfff"
        shape_float: "#d4bfff"
        shape_range: "#ffd580"
        shape_internalcall: "#95e6cb"
        shape_external: "#90e1c6"
        shape_externalarg: "#bae67e"
        shape_literal: "#6dcbfa"
        shape_operator: "#fad07b"
        shape_signature: "#bae67e"
        shape_string: "#a6cc70"
        shape_string_interpolation: "#95e6cb"
        shape_datetime: "#95e6cb"
        shape_list: "#95e6cb"
        shape_table: "#73d0ff"
        shape_record: "#95e6cb"
        shape_block: "#73d0ff"
        shape_filepath: "#90e1c6"
        shape_globpattern: "#95e6cb"
        shape_variable: "#cfbafa"
        shape_flag: "#73d0ff"
        shape_custom: "#a6cc70"
        shape_nothing: "#95e6cb"
    }
}
