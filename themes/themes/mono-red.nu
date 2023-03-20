export def main [] {
    # extra desired values for the mono_red theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2b0c00"
    # foreground: "#ff3600"
    # cursor: "#ff3600"

    {
        # color for nushell primitives
        separator: "#ff3600"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#ff3600"
        empty: "#ff3600"
        bool: "#ff3600"
        int: "#ff3600"
        filesize: "#ff3600"
        duration: "#ff3600"
        date: "#ff3600"
        range: "#ff3600"
        float: "#ff3600"
        string: "#ff3600"
        nothing: "#ff3600"
        binary: "#ff3600"
        cellpath: "#ff3600"
        row_index: "#ff3600"
        record: "#ff3600"
        list: "#ff3600"
        block: "#ff3600"
        hints: "#ff3600"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff3600"
        shape_bool: "#ff3600"
        shape_int: "#ff3600"
        shape_float: "#ff3600"
        shape_range: "#ff3600"
        shape_internalcall: "#ff3600"
        shape_external: "#ff3600"
        shape_externalarg: "#ff3600"
        shape_literal: "#ff3600"
        shape_operator: "#ff3600"
        shape_signature: "#ff3600"
        shape_string: "#ff3600"
        shape_string_interpolation: "#ff3600"
        shape_datetime: "#ff3600"
        shape_list: "#ff3600"
        shape_table: "#ff3600"
        shape_record: "#ff3600"
        shape_block: "#ff3600"
        shape_filepath: "#ff3600"
        shape_globpattern: "#ff3600"
        shape_variable: "#ff3600"
        shape_flag: "#ff3600"
        shape_custom: "#ff3600"
        shape_nothing: "#ff3600"
    }
}
