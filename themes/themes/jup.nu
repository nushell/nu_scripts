export def main [] {
    # extra desired values for the jup theme
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
        header: "#b9ff74"
        empty: "#006fdd"
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
        row_index: "#b9ff74"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#7d7d7d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b974ff"
        shape_bool: "#74ffb9"
        shape_int: "#b974ff"
        shape_float: "#b974ff"
        shape_range: "#ffb974"
        shape_internalcall: "#74ffb9"
        shape_external: "#00dd6f"
        shape_externalarg: "#b9ff74"
        shape_literal: "#006fdd"
        shape_operator: "#dd6f00"
        shape_signature: "#b9ff74"
        shape_string: "#6fdd00"
        shape_string_interpolation: "#74ffb9"
        shape_datetime: "#74ffb9"
        shape_list: "#74ffb9"
        shape_table: "#74b9ff"
        shape_record: "#74ffb9"
        shape_block: "#74b9ff"
        shape_filepath: "#00dd6f"
        shape_globpattern: "#74ffb9"
        shape_variable: "#6f00dd"
        shape_flag: "#74b9ff"
        shape_custom: "#6fdd00"
        shape_nothing: "#74ffb9"
    }
}
