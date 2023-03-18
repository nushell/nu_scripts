export def main [] {
    # extra desired values for the ayu theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0e1419"
    # foreground: "#e5e1cf"
    # cursor: "#f19618"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#e9fe83"
        empty: "#36a3d9"
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
        row_index: "#e9fe83"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#323232"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ffa3aa"
        shape_bool: "#c7fffc"
        shape_int: "#ffa3aa"
        shape_float: "#ffa3aa"
        shape_range: "#fff778"
        shape_internalcall: "#c7fffc"
        shape_external: "#95e5cb"
        shape_externalarg: "#e9fe83"
        shape_literal: "#36a3d9"
        shape_operator: "#e6c446"
        shape_signature: "#e9fe83"
        shape_string: "#b8cc52"
        shape_string_interpolation: "#c7fffc"
        shape_datetime: "#c7fffc"
        shape_list: "#c7fffc"
        shape_table: "#68d4ff"
        shape_record: "#c7fffc"
        shape_block: "#68d4ff"
        shape_filepath: "#95e5cb"
        shape_globpattern: "#c7fffc"
        shape_variable: "#f07078"
        shape_flag: "#68d4ff"
        shape_custom: "#b8cc52"
        shape_nothing: "#c7fffc"
    }
}
