export def main [] {
    # extra desired values for the idm_3b theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#200a28"
    # foreground: "#ffcada"
    # cursor: "#ffa0a0"

    {
        # color for nushell primitives
        separator: "#e0e0e0"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#aaf0d0"
        empty: "#408aca"
        bool: "#e0e0e0"
        int: "#e0e0e0"
        filesize: "#e0e0e0"
        duration: "#e0e0e0"
        date: "#e0e0e0"
        range: "#e0e0e0"
        float: "#e0e0e0"
        string: "#e0e0e0"
        nothing: "#e0e0e0"
        binary: "#e0e0e0"
        cellpath: "#e0e0e0"
        row_index: "#aaf0d0"
        record: "#e0e0e0"
        list: "#e0e0e0"
        block: "#e0e0e0"
        hints: "#b0b0b0"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ffb0d0"
        shape_bool: "#caa0f0"
        shape_int: "#ffb0d0"
        shape_float: "#ffb0d0"
        shape_range: "#ffda90"
        shape_internalcall: "#caa0f0"
        shape_external: "#a070e0"
        shape_externalarg: "#aaf0d0"
        shape_literal: "#408aca"
        shape_operator: "#ffb060"
        shape_signature: "#aaf0d0"
        shape_string: "#70d0a0"
        shape_string_interpolation: "#caa0f0"
        shape_datetime: "#caa0f0"
        shape_list: "#caa0f0"
        shape_table: "#80baf0"
        shape_record: "#caa0f0"
        shape_block: "#80baf0"
        shape_filepath: "#a070e0"
        shape_globpattern: "#caa0f0"
        shape_variable: "#ba5aba"
        shape_flag: "#80baf0"
        shape_custom: "#70d0a0"
        shape_nothing: "#caa0f0"
    }
}
