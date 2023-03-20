export def main [] {
    # extra desired values for the mono_green theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#022b00"
    # foreground: "#0bff00"
    # cursor: "#0bff00"

    {
        # color for nushell primitives
        separator: "#0bff00"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#0bff00"
        empty: "#0bff00"
        bool: "#0bff00"
        int: "#0bff00"
        filesize: "#0bff00"
        duration: "#0bff00"
        date: "#0bff00"
        range: "#0bff00"
        float: "#0bff00"
        string: "#0bff00"
        nothing: "#0bff00"
        binary: "#0bff00"
        cellpath: "#0bff00"
        row_index: "#0bff00"
        record: "#0bff00"
        list: "#0bff00"
        block: "#0bff00"
        hints: "#0bff00"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#0bff00"
        shape_bool: "#0bff00"
        shape_int: "#0bff00"
        shape_float: "#0bff00"
        shape_range: "#0bff00"
        shape_internalcall: "#0bff00"
        shape_external: "#0bff00"
        shape_externalarg: "#0bff00"
        shape_literal: "#0bff00"
        shape_operator: "#0bff00"
        shape_signature: "#0bff00"
        shape_string: "#0bff00"
        shape_string_interpolation: "#0bff00"
        shape_datetime: "#0bff00"
        shape_list: "#0bff00"
        shape_table: "#0bff00"
        shape_record: "#0bff00"
        shape_block: "#0bff00"
        shape_filepath: "#0bff00"
        shape_globpattern: "#0bff00"
        shape_variable: "#0bff00"
        shape_flag: "#0bff00"
        shape_custom: "#0bff00"
        shape_nothing: "#0bff00"
    }
}
