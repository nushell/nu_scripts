export def main [] {
    # extra desired values for the cupcake theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#fbf1f2"
    # foreground: "#8b8198"
    # cursor: "#8b8198"

    {
        # color for nushell primitives
        separator: "#585062"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a3b367"
        empty: "#7297b9"
        bool: "#585062"
        int: "#585062"
        filesize: "#585062"
        duration: "#585062"
        date: "#585062"
        range: "#585062"
        float: "#585062"
        string: "#585062"
        nothing: "#585062"
        binary: "#585062"
        cellpath: "#585062"
        row_index: "#a3b367"
        record: "#585062"
        list: "#585062"
        block: "#585062"
        hints: "#bfb9c6"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#bb99b4"
        shape_bool: "#69a9a7"
        shape_int: "#bb99b4"
        shape_float: "#bb99b4"
        shape_range: "#dcb16c"
        shape_internalcall: "#69a9a7"
        shape_external: "#69a9a7"
        shape_externalarg: "#a3b367"
        shape_literal: "#7297b9"
        shape_operator: "#dcb16c"
        shape_signature: "#a3b367"
        shape_string: "#a3b367"
        shape_string_interpolation: "#69a9a7"
        shape_datetime: "#69a9a7"
        shape_list: "#69a9a7"
        shape_table: "#7297b9"
        shape_record: "#69a9a7"
        shape_block: "#7297b9"
        shape_filepath: "#69a9a7"
        shape_globpattern: "#69a9a7"
        shape_variable: "#bb99b4"
        shape_flag: "#7297b9"
        shape_custom: "#a3b367"
        shape_nothing: "#69a9a7"
    }
}
