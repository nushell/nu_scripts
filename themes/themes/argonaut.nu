export def main [] {
    # extra desired values for the argonaut theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0e1019"
    # foreground: "#fffaf4"
    # cursor: "#fffaf4"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#abe15b"
        empty: "#008df8"
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
        row_index: "#abe15b"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#444444"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9a5feb"
        shape_bool: "#67fff0"
        shape_int: "#9a5feb"
        shape_float: "#9a5feb"
        shape_range: "#ffd242"
        shape_internalcall: "#67fff0"
        shape_external: "#00d8eb"
        shape_externalarg: "#abe15b"
        shape_literal: "#008df8"
        shape_operator: "#ffb900"
        shape_signature: "#abe15b"
        shape_string: "#8ce10b"
        shape_string_interpolation: "#67fff0"
        shape_datetime: "#67fff0"
        shape_list: "#67fff0"
        shape_table: "#0092ff"
        shape_record: "#67fff0"
        shape_block: "#0092ff"
        shape_filepath: "#00d8eb"
        shape_globpattern: "#67fff0"
        shape_variable: "#6d43a6"
        shape_flag: "#0092ff"
        shape_custom: "#8ce10b"
        shape_nothing: "#67fff0"
    }
}
