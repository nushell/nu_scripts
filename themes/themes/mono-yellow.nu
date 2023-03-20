export def main [] {
    # extra desired values for the mono_yellow theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2b2400"
    # foreground: "#ffd300"
    # cursor: "#ffd300"

    {
        # color for nushell primitives
        separator: "#ffd300"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#ffd300"
        empty: "#ffd300"
        bool: "#ffd300"
        int: "#ffd300"
        filesize: "#ffd300"
        duration: "#ffd300"
        date: "#ffd300"
        range: "#ffd300"
        float: "#ffd300"
        string: "#ffd300"
        nothing: "#ffd300"
        binary: "#ffd300"
        cellpath: "#ffd300"
        row_index: "#ffd300"
        record: "#ffd300"
        list: "#ffd300"
        block: "#ffd300"
        hints: "#ffd300"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ffd300"
        shape_bool: "#ffd300"
        shape_int: "#ffd300"
        shape_float: "#ffd300"
        shape_range: "#ffd300"
        shape_internalcall: "#ffd300"
        shape_external: "#ffd300"
        shape_externalarg: "#ffd300"
        shape_literal: "#ffd300"
        shape_operator: "#ffd300"
        shape_signature: "#ffd300"
        shape_string: "#ffd300"
        shape_string_interpolation: "#ffd300"
        shape_datetime: "#ffd300"
        shape_list: "#ffd300"
        shape_table: "#ffd300"
        shape_record: "#ffd300"
        shape_block: "#ffd300"
        shape_filepath: "#ffd300"
        shape_globpattern: "#ffd300"
        shape_variable: "#ffd300"
        shape_flag: "#ffd300"
        shape_custom: "#ffd300"
        shape_nothing: "#ffd300"
    }
}
