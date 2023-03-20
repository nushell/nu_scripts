export def main [] {
    # extra desired values for the bright theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#e0e0e0"
    # cursor: "#e0e0e0"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a1c659"
        empty: "#6fb3d2"
        bool: "#ffffff"
        int: "#ffffff"
        filesize: "#ffffff"
        duration: "#ffffff"
        date: "#ffffff"
        range: "#ffffff"
        float: "#ffffff"
        string: "#ffffff"
        nothing: "#ffffff"
        binary: "#ffffff"
        cellpath: "#ffffff"
        row_index: "#a1c659"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#b0b0b0"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d381c3"
        shape_bool: "#76c7b7"
        shape_int: "#d381c3"
        shape_float: "#d381c3"
        shape_range: "#fda331"
        shape_internalcall: "#76c7b7"
        shape_external: "#76c7b7"
        shape_externalarg: "#a1c659"
        shape_literal: "#6fb3d2"
        shape_operator: "#fda331"
        shape_signature: "#a1c659"
        shape_string: "#a1c659"
        shape_string_interpolation: "#76c7b7"
        shape_datetime: "#76c7b7"
        shape_list: "#76c7b7"
        shape_table: "#6fb3d2"
        shape_record: "#76c7b7"
        shape_block: "#6fb3d2"
        shape_filepath: "#76c7b7"
        shape_globpattern: "#76c7b7"
        shape_variable: "#d381c3"
        shape_flag: "#6fb3d2"
        shape_custom: "#a1c659"
        shape_nothing: "#76c7b7"
    }
}
