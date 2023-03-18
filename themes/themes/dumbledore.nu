export def main [] {
    # extra desired values for the dumbledore theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#422553"
    # foreground: "#c4c8c5"
    # cursor: "#c4c8c5"

    {
        # color for nushell primitives
        separator: "#c9c9c9"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#aaaaaa"
        empty: "#415baf"
        bool: "#c9c9c9"
        int: "#c9c9c9"
        filesize: "#c9c9c9"
        duration: "#c9c9c9"
        date: "#c9c9c9"
        range: "#c9c9c9"
        float: "#c9c9c9"
        string: "#c9c9c9"
        nothing: "#c9c9c9"
        binary: "#c9c9c9"
        cellpath: "#c9c9c9"
        row_index: "#aaaaaa"
        record: "#c9c9c9"
        list: "#c9c9c9"
        block: "#c9c9c9"
        hints: "#413e53"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b294ba"
        shape_bool: "#25de50"
        shape_int: "#b294ba"
        shape_float: "#b294ba"
        shape_range: "#716254"
        shape_internalcall: "#25de50"
        shape_external: "#008aff"
        shape_externalarg: "#aaaaaa"
        shape_literal: "#415baf"
        shape_operator: "#f0c75e"
        shape_signature: "#aaaaaa"
        shape_string: "#3e7c54"
        shape_string_interpolation: "#25de50"
        shape_datetime: "#25de50"
        shape_list: "#25de50"
        shape_table: "#946a2c"
        shape_record: "#25de50"
        shape_block: "#946a2c"
        shape_filepath: "#008aff"
        shape_globpattern: "#25de50"
        shape_variable: "#9445ae"
        shape_flag: "#946a2c"
        shape_custom: "#3e7c54"
        shape_nothing: "#25de50"
    }
}
