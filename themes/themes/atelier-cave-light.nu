export def main [] {
    # extra desired values for the atelier_cave-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#efecf4"
    # foreground: "#585260"
    # cursor: "#585260"

    {
        # color for nushell primitives
        separator: "#19171c"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#2a9292"
        empty: "#576ddb"
        bool: "#19171c"
        int: "#19171c"
        filesize: "#19171c"
        duration: "#19171c"
        date: "#19171c"
        range: "#19171c"
        float: "#19171c"
        string: "#19171c"
        nothing: "#19171c"
        binary: "#19171c"
        cellpath: "#19171c"
        row_index: "#2a9292"
        record: "#19171c"
        list: "#19171c"
        block: "#19171c"
        hints: "#7e7887"

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
