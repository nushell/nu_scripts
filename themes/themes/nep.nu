export def main [] {
    # extra desired values for the nep theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#758480"
    # foreground: "#23476a"
    # cursor: "#23476a"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#74ffb9"
        empty: "#6f00dd"
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
        row_index: "#74ffb9"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#7d7d7d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff74b9"
        shape_bool: "#74b9ff"
        shape_int: "#ff74b9"
        shape_float: "#ff74b9"
        shape_range: "#b9ff74"
        shape_internalcall: "#74b9ff"
        shape_external: "#006fdd"
        shape_externalarg: "#74ffb9"
        shape_literal: "#6f00dd"
        shape_operator: "#6fdd00"
        shape_signature: "#74ffb9"
        shape_string: "#00dd6f"
        shape_string_interpolation: "#74b9ff"
        shape_datetime: "#74b9ff"
        shape_list: "#74b9ff"
        shape_table: "#b974ff"
        shape_record: "#74b9ff"
        shape_block: "#b974ff"
        shape_filepath: "#006fdd"
        shape_globpattern: "#74b9ff"
        shape_variable: "#dd006f"
        shape_flag: "#b974ff"
        shape_custom: "#00dd6f"
        shape_nothing: "#74b9ff"
    }
}
