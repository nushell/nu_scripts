export def main [] {
    # extra desired values for the tempus_tempest theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#282b2b"
    # foreground: "#b6e0ca"
    # cursor: "#b6e0ca"

    {
        # color for nushell primitives
        separator: "#b6e0ca"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#99e299"
        empty: "#60d4cd"
        bool: "#b6e0ca"
        int: "#b6e0ca"
        filesize: "#b6e0ca"
        duration: "#b6e0ca"
        date: "#b6e0ca"
        range: "#b6e0ca"
        float: "#b6e0ca"
        string: "#b6e0ca"
        nothing: "#b6e0ca"
        binary: "#b6e0ca"
        cellpath: "#b6e0ca"
        row_index: "#99e299"
        record: "#b6e0ca"
        list: "#b6e0ca"
        block: "#b6e0ca"
        hints: "#303434"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d2d4aa"
        shape_bool: "#9bdfc4"
        shape_int: "#d2d4aa"
        shape_float: "#d2d4aa"
        shape_range: "#bbde4f"
        shape_internalcall: "#9bdfc4"
        shape_external: "#8ad0b0"
        shape_externalarg: "#99e299"
        shape_literal: "#60d4cd"
        shape_operator: "#bfc94a"
        shape_signature: "#99e299"
        shape_string: "#7ad67a"
        shape_string_interpolation: "#9bdfc4"
        shape_datetime: "#9bdfc4"
        shape_list: "#9bdfc4"
        shape_table: "#74e4cd"
        shape_record: "#9bdfc4"
        shape_block: "#74e4cd"
        shape_filepath: "#8ad0b0"
        shape_globpattern: "#9bdfc4"
        shape_variable: "#c0c4aa"
        shape_flag: "#74e4cd"
        shape_custom: "#7ad67a"
        shape_nothing: "#9bdfc4"
    }
}
