export def main [] {
    # extra desired values for the blazer theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0d1926"
    # foreground: "#d9e6f2"
    # cursor: "#d9e6f2"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#bddbbd"
        empty: "#7a7ab8"
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
        row_index: "#bddbbd"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#262626"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#dbbddb"
        shape_bool: "#bddbdb"
        shape_int: "#dbbddb"
        shape_float: "#dbbddb"
        shape_range: "#dbdbbd"
        shape_internalcall: "#bddbdb"
        shape_external: "#7ab8b8"
        shape_externalarg: "#bddbbd"
        shape_literal: "#7a7ab8"
        shape_operator: "#b8b87a"
        shape_signature: "#bddbbd"
        shape_string: "#7ab87a"
        shape_string_interpolation: "#bddbdb"
        shape_datetime: "#bddbdb"
        shape_list: "#bddbdb"
        shape_table: "#bdbddb"
        shape_record: "#bddbdb"
        shape_block: "#bdbddb"
        shape_filepath: "#7ab8b8"
        shape_globpattern: "#bddbdb"
        shape_variable: "#b87ab8"
        shape_flag: "#bdbddb"
        shape_custom: "#7ab87a"
        shape_nothing: "#bddbdb"
    }
}
