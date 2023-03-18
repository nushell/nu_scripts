export def main [] {
    # extra desired values for the floraverse theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0e0c15"
    # foreground: "#dbd0b9"
    # cursor: "#bbbbbb"

    {
        # color for nushell primitives
        separator: "#fff5db"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b3ce58"
        empty: "#1d6da1"
        bool: "#fff5db"
        int: "#fff5db"
        filesize: "#fff5db"
        duration: "#fff5db"
        date: "#fff5db"
        range: "#fff5db"
        float: "#fff5db"
        string: "#fff5db"
        nothing: "#fff5db"
        binary: "#fff5db"
        cellpath: "#fff5db"
        row_index: "#b3ce58"
        record: "#fff5db"
        list: "#fff5db"
        block: "#fff5db"
        hints: "#331d4c"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#f02aae"
        shape_bool: "#62caa8"
        shape_int: "#f02aae"
        shape_float: "#f02aae"
        shape_range: "#fac357"
        shape_internalcall: "#62caa8"
        shape_external: "#42a38c"
        shape_externalarg: "#b3ce58"
        shape_literal: "#1d6da1"
        shape_operator: "#cd751c"
        shape_signature: "#b3ce58"
        shape_string: "#5d731a"
        shape_string_interpolation: "#62caa8"
        shape_datetime: "#62caa8"
        shape_list: "#62caa8"
        shape_table: "#40a4cf"
        shape_record: "#62caa8"
        shape_block: "#40a4cf"
        shape_filepath: "#42a38c"
        shape_globpattern: "#62caa8"
        shape_variable: "#b7077e"
        shape_flag: "#40a4cf"
        shape_custom: "#5d731a"
        shape_nothing: "#62caa8"
    }
}
