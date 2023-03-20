export def main [] {
    # extra desired values for the espresso theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2d2d2d"
    # foreground: "#cccccc"
    # cursor: "#cccccc"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a5c261"
        empty: "#6c99bb"
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
        row_index: "#a5c261"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#777777"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d197d9"
        shape_bool: "#bed6ff"
        shape_int: "#d197d9"
        shape_float: "#d197d9"
        shape_range: "#ffc66d"
        shape_internalcall: "#bed6ff"
        shape_external: "#bed6ff"
        shape_externalarg: "#a5c261"
        shape_literal: "#6c99bb"
        shape_operator: "#ffc66d"
        shape_signature: "#a5c261"
        shape_string: "#a5c261"
        shape_string_interpolation: "#bed6ff"
        shape_datetime: "#bed6ff"
        shape_list: "#bed6ff"
        shape_table: "#6c99bb"
        shape_record: "#bed6ff"
        shape_block: "#6c99bb"
        shape_filepath: "#bed6ff"
        shape_globpattern: "#bed6ff"
        shape_variable: "#d197d9"
        shape_flag: "#6c99bb"
        shape_custom: "#a5c261"
        shape_nothing: "#bed6ff"
    }
}
