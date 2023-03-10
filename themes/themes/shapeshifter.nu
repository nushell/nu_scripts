export def main [] {
    # extra desired values for the shapeshifter theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f9f9f9"
    # foreground: "#102015"
    # cursor: "#102015"

    {
        # color for nushell primitives
        separator: "#000000"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#0ed839"
        empty: "#3b48e3"
        bool: "#000000"
        int: "#000000"
        filesize: "#000000"
        duration: "#000000"
        date: "#000000"
        range: "#000000"
        float: "#000000"
        string: "#000000"
        nothing: "#000000"
        binary: "#000000"
        cellpath: "#000000"
        row_index: "#0ed839"
        record: "#000000"
        list: "#000000"
        block: "#000000"
        hints: "#555555"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#f996e2"
        shape_bool: "#23edda"
        shape_int: "#f996e2"
        shape_float: "#f996e2"
        shape_range: "#dddd13"
        shape_internalcall: "#23edda"
        shape_external: "#23edda"
        shape_externalarg: "#0ed839"
        shape_literal: "#3b48e3"
        shape_operator: "#dddd13"
        shape_signature: "#0ed839"
        shape_string: "#0ed839"
        shape_string_interpolation: "#23edda"
        shape_datetime: "#23edda"
        shape_list: "#23edda"
        shape_table: "#3b48e3"
        shape_record: "#23edda"
        shape_block: "#3b48e3"
        shape_filepath: "#23edda"
        shape_globpattern: "#23edda"
        shape_variable: "#f996e2"
        shape_flag: "#3b48e3"
        shape_custom: "#0ed839"
        shape_nothing: "#23edda"
    }
}
