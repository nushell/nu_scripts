export def main [] {
    # extra desired values for the hemisu_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#ffffff"
    # cursor: "#baffaa"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#baffaa"
        empty: "#67bee3"
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
        row_index: "#baffaa"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#777777"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#deb3df"
        shape_bool: "#b6e0e5"
        shape_int: "#deb3df"
        shape_float: "#deb3df"
        shape_range: "#ece1c8"
        shape_internalcall: "#b6e0e5"
        shape_external: "#569a9f"
        shape_externalarg: "#baffaa"
        shape_literal: "#67bee3"
        shape_operator: "#9d895e"
        shape_signature: "#baffaa"
        shape_string: "#b1d630"
        shape_string_interpolation: "#b6e0e5"
        shape_datetime: "#b6e0e5"
        shape_list: "#b6e0e5"
        shape_table: "#9fd3e5"
        shape_record: "#b6e0e5"
        shape_block: "#9fd3e5"
        shape_filepath: "#569a9f"
        shape_globpattern: "#b6e0e5"
        shape_variable: "#b576bc"
        shape_flag: "#9fd3e5"
        shape_custom: "#b1d630"
        shape_nothing: "#b6e0e5"
    }
}
