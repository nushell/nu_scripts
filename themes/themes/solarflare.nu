export def main [] {
    # extra desired values for the solarflare theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#18262f"
    # foreground: "#a6afb8"
    # cursor: "#a6afb8"

    {
        # color for nushell primitives
        separator: "#f5f7fa"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7cc844"
        empty: "#33b5e1"
        bool: "#f5f7fa"
        int: "#f5f7fa"
        filesize: "#f5f7fa"
        duration: "#f5f7fa"
        date: "#f5f7fa"
        range: "#f5f7fa"
        float: "#f5f7fa"
        string: "#f5f7fa"
        nothing: "#f5f7fa"
        binary: "#f5f7fa"
        cellpath: "#f5f7fa"
        row_index: "#7cc844"
        record: "#f5f7fa"
        list: "#f5f7fa"
        block: "#f5f7fa"
        hints: "#667581"

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
