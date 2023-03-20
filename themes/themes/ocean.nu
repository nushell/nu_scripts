export def main [] {
    # extra desired values for the ocean theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2b303b"
    # foreground: "#c0c5ce"
    # cursor: "#c0c5ce"

    {
        # color for nushell primitives
        separator: "#eff1f5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a3be8c"
        empty: "#8fa1b3"
        bool: "#eff1f5"
        int: "#eff1f5"
        filesize: "#eff1f5"
        duration: "#eff1f5"
        date: "#eff1f5"
        range: "#eff1f5"
        float: "#eff1f5"
        string: "#eff1f5"
        nothing: "#eff1f5"
        binary: "#eff1f5"
        cellpath: "#eff1f5"
        row_index: "#a3be8c"
        record: "#eff1f5"
        list: "#eff1f5"
        block: "#eff1f5"
        hints: "#65737e"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b48ead"
        shape_bool: "#96b5b4"
        shape_int: "#b48ead"
        shape_float: "#b48ead"
        shape_range: "#ebcb8b"
        shape_internalcall: "#96b5b4"
        shape_external: "#96b5b4"
        shape_externalarg: "#a3be8c"
        shape_literal: "#8fa1b3"
        shape_operator: "#ebcb8b"
        shape_signature: "#a3be8c"
        shape_string: "#a3be8c"
        shape_string_interpolation: "#96b5b4"
        shape_datetime: "#96b5b4"
        shape_list: "#96b5b4"
        shape_table: "#8fa1b3"
        shape_record: "#96b5b4"
        shape_block: "#8fa1b3"
        shape_filepath: "#96b5b4"
        shape_globpattern: "#96b5b4"
        shape_variable: "#b48ead"
        shape_flag: "#8fa1b3"
        shape_custom: "#a3be8c"
        shape_nothing: "#96b5b4"
    }
}
