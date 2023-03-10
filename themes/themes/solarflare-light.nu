export def main [] {
    # extra desired values for the solarflare_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f5f7fa"
    # foreground: "#586875"
    # cursor: "#586875"

    {
        # color for nushell primitives
        separator: "#18262f"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7cc844"
        empty: "#33b5e1"
        bool: "#18262f"
        int: "#18262f"
        filesize: "#18262f"
        duration: "#18262f"
        date: "#18262f"
        range: "#18262f"
        float: "#18262f"
        string: "#18262f"
        nothing: "#18262f"
        binary: "#18262f"
        cellpath: "#18262f"
        row_index: "#7cc844"
        record: "#18262f"
        list: "#18262f"
        block: "#18262f"
        hints: "#85939e"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a363d5"
        shape_bool: "#52cbb0"
        shape_int: "#a363d5"
        shape_float: "#a363d5"
        shape_range: "#e4b51c"
        shape_internalcall: "#52cbb0"
        shape_external: "#52cbb0"
        shape_externalarg: "#7cc844"
        shape_literal: "#33b5e1"
        shape_operator: "#e4b51c"
        shape_signature: "#7cc844"
        shape_string: "#7cc844"
        shape_string_interpolation: "#52cbb0"
        shape_datetime: "#52cbb0"
        shape_list: "#52cbb0"
        shape_table: "#33b5e1"
        shape_record: "#52cbb0"
        shape_block: "#33b5e1"
        shape_filepath: "#52cbb0"
        shape_globpattern: "#52cbb0"
        shape_variable: "#a363d5"
        shape_flag: "#33b5e1"
        shape_custom: "#7cc844"
        shape_nothing: "#52cbb0"
    }
}
