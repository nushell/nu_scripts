export def main [] {
    # extra desired values for the tempus_day theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f8f2e5"
    # foreground: "#464340"
    # cursor: "#464340"

    {
        # color for nushell primitives
        separator: "#f8f2e5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#4a7240"
        empty: "#385dc4"
        bool: "#f8f2e5"
        int: "#f8f2e5"
        filesize: "#f8f2e5"
        duration: "#f8f2e5"
        date: "#f8f2e5"
        range: "#f8f2e5"
        float: "#f8f2e5"
        string: "#f8f2e5"
        nothing: "#f8f2e5"
        binary: "#f8f2e5"
        cellpath: "#f8f2e5"
        row_index: "#4a7240"
        record: "#f8f2e5"
        list: "#f8f2e5"
        block: "#f8f2e5"
        hints: "#68607d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8055aa"
        shape_bool: "#337087"
        shape_int: "#8055aa"
        shape_float: "#8055aa"
        shape_range: "#706a00"
        shape_internalcall: "#337087"
        shape_external: "#007070"
        shape_externalarg: "#4a7240"
        shape_literal: "#385dc4"
        shape_operator: "#806000"
        shape_signature: "#4a7240"
        shape_string: "#107410"
        shape_string_interpolation: "#337087"
        shape_datetime: "#337087"
        shape_list: "#337087"
        shape_table: "#0d66c9"
        shape_record: "#337087"
        shape_block: "#0d66c9"
        shape_filepath: "#007070"
        shape_globpattern: "#337087"
        shape_variable: "#b63052"
        shape_flag: "#0d66c9"
        shape_custom: "#107410"
        shape_nothing: "#337087"
    }
}
