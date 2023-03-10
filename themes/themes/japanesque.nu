export def main [] {
    # extra desired values for the japanesque theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1e1e1e"
    # foreground: "#f7f6ec"
    # cursor: "#f7f6ec"

    {
        # color for nushell primitives
        separator: "#b2b5ae"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#767f2c"
        empty: "#4c9ad4"
        bool: "#b2b5ae"
        int: "#b2b5ae"
        filesize: "#b2b5ae"
        duration: "#b2b5ae"
        date: "#b2b5ae"
        range: "#b2b5ae"
        float: "#b2b5ae"
        string: "#b2b5ae"
        nothing: "#b2b5ae"
        binary: "#b2b5ae"
        cellpath: "#b2b5ae"
        row_index: "#767f2c"
        record: "#b2b5ae"
        list: "#b2b5ae"
        block: "#b2b5ae"
        hints: "#595b59"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#604291"
        shape_bool: "#76bbca"
        shape_int: "#604291"
        shape_float: "#604291"
        shape_range: "#78592f"
        shape_internalcall: "#76bbca"
        shape_external: "#389aad"
        shape_externalarg: "#767f2c"
        shape_literal: "#4c9ad4"
        shape_operator: "#e9b32a"
        shape_signature: "#767f2c"
        shape_string: "#7bb75b"
        shape_string_interpolation: "#76bbca"
        shape_datetime: "#76bbca"
        shape_list: "#76bbca"
        shape_table: "#135979"
        shape_record: "#76bbca"
        shape_block: "#135979"
        shape_filepath: "#389aad"
        shape_globpattern: "#76bbca"
        shape_variable: "#a57fc4"
        shape_flag: "#135979"
        shape_custom: "#7bb75b"
        shape_nothing: "#76bbca"
    }
}
