export def main [] {
    # extra desired values for the mono_amber theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2b1900"
    # foreground: "#ff9400"
    # cursor: "#ff9400"

    {
        # color for nushell primitives
        separator: "#ff9400"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#ff9400"
        empty: "#ff9400"
        bool: "#ff9400"
        int: "#ff9400"
        filesize: "#ff9400"
        duration: "#ff9400"
        date: "#ff9400"
        range: "#ff9400"
        float: "#ff9400"
        string: "#ff9400"
        nothing: "#ff9400"
        binary: "#ff9400"
        cellpath: "#ff9400"
        row_index: "#ff9400"
        record: "#ff9400"
        list: "#ff9400"
        block: "#ff9400"
        hints: "#ff9400"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff9400"
        shape_bool: "#ff9400"
        shape_int: "#ff9400"
        shape_float: "#ff9400"
        shape_range: "#ff9400"
        shape_internalcall: "#ff9400"
        shape_external: "#ff9400"
        shape_externalarg: "#ff9400"
        shape_literal: "#ff9400"
        shape_operator: "#ff9400"
        shape_signature: "#ff9400"
        shape_string: "#ff9400"
        shape_string_interpolation: "#ff9400"
        shape_datetime: "#ff9400"
        shape_list: "#ff9400"
        shape_table: "#ff9400"
        shape_record: "#ff9400"
        shape_block: "#ff9400"
        shape_filepath: "#ff9400"
        shape_globpattern: "#ff9400"
        shape_variable: "#ff9400"
        shape_flag: "#ff9400"
        shape_custom: "#ff9400"
        shape_nothing: "#ff9400"
    }
}
