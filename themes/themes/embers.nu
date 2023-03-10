export def main [] {
    # extra desired values for the embers theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#16130f"
    # foreground: "#a39a90"
    # cursor: "#a39a90"

    {
        # color for nushell primitives
        separator: "#dbd6d1"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#57826d"
        empty: "#6d5782"
        bool: "#dbd6d1"
        int: "#dbd6d1"
        filesize: "#dbd6d1"
        duration: "#dbd6d1"
        date: "#dbd6d1"
        range: "#dbd6d1"
        float: "#dbd6d1"
        string: "#dbd6d1"
        nothing: "#dbd6d1"
        binary: "#dbd6d1"
        cellpath: "#dbd6d1"
        row_index: "#57826d"
        record: "#dbd6d1"
        list: "#dbd6d1"
        block: "#dbd6d1"
        hints: "#5a5047"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#82576d"
        shape_bool: "#576d82"
        shape_int: "#82576d"
        shape_float: "#82576d"
        shape_range: "#6d8257"
        shape_internalcall: "#576d82"
        shape_external: "#576d82"
        shape_externalarg: "#57826d"
        shape_literal: "#6d5782"
        shape_operator: "#6d8257"
        shape_signature: "#57826d"
        shape_string: "#57826d"
        shape_string_interpolation: "#576d82"
        shape_datetime: "#576d82"
        shape_list: "#576d82"
        shape_table: "#6d5782"
        shape_record: "#576d82"
        shape_block: "#6d5782"
        shape_filepath: "#576d82"
        shape_globpattern: "#576d82"
        shape_variable: "#82576d"
        shape_flag: "#6d5782"
        shape_custom: "#57826d"
        shape_nothing: "#576d82"
    }
}
