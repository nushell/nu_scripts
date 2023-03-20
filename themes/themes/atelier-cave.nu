export def main [] {
    # extra desired values for the atelier_cave theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#19171c"
    # foreground: "#8b8792"
    # cursor: "#8b8792"

    {
        # color for nushell primitives
        separator: "#efecf4"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#2a9292"
        empty: "#576ddb"
        bool: "#efecf4"
        int: "#efecf4"
        filesize: "#efecf4"
        duration: "#efecf4"
        date: "#efecf4"
        range: "#efecf4"
        float: "#efecf4"
        string: "#efecf4"
        nothing: "#efecf4"
        binary: "#efecf4"
        cellpath: "#efecf4"
        row_index: "#2a9292"
        record: "#efecf4"
        list: "#efecf4"
        block: "#efecf4"
        hints: "#655f6d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#955ae7"
        shape_bool: "#398bc6"
        shape_int: "#955ae7"
        shape_float: "#955ae7"
        shape_range: "#a06e3b"
        shape_internalcall: "#398bc6"
        shape_external: "#398bc6"
        shape_externalarg: "#2a9292"
        shape_literal: "#576ddb"
        shape_operator: "#a06e3b"
        shape_signature: "#2a9292"
        shape_string: "#2a9292"
        shape_string_interpolation: "#398bc6"
        shape_datetime: "#398bc6"
        shape_list: "#398bc6"
        shape_table: "#576ddb"
        shape_record: "#398bc6"
        shape_block: "#576ddb"
        shape_filepath: "#398bc6"
        shape_globpattern: "#398bc6"
        shape_variable: "#955ae7"
        shape_flag: "#576ddb"
        shape_custom: "#2a9292"
        shape_nothing: "#398bc6"
    }
}
