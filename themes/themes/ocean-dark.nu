export def main [] {
    # extra desired values for the ocean_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1c1f27"
    # foreground: "#979cac"
    # cursor: "#979cac"

    {
        # color for nushell primitives
        separator: "#fefffe"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#ceffab"
        empty: "#7d90a4"
        bool: "#fefffe"
        int: "#fefffe"
        filesize: "#fefffe"
        duration: "#fefffe"
        date: "#fefffe"
        range: "#fefffe"
        float: "#fefffe"
        string: "#fefffe"
        nothing: "#fefffe"
        binary: "#fefffe"
        cellpath: "#fefffe"
        row_index: "#ceffab"
        record: "#fefffe"
        list: "#fefffe"
        block: "#fefffe"
        hints: "#7b7b7b"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#fb9bfe"
        shape_bool: "#dfdffd"
        shape_int: "#fb9bfe"
        shape_float: "#fb9bfe"
        shape_range: "#fffecc"
        shape_internalcall: "#dfdffd"
        shape_external: "#85a6a5"
        shape_externalarg: "#ceffab"
        shape_literal: "#7d90a4"
        shape_operator: "#e5c079"
        shape_signature: "#ceffab"
        shape_string: "#afd383"
        shape_string_interpolation: "#dfdffd"
        shape_datetime: "#dfdffd"
        shape_list: "#dfdffd"
        shape_table: "#b5dcfe"
        shape_record: "#dfdffd"
        shape_block: "#b5dcfe"
        shape_filepath: "#85a6a5"
        shape_globpattern: "#dfdffd"
        shape_variable: "#a4799d"
        shape_flag: "#b5dcfe"
        shape_custom: "#afd383"
        shape_nothing: "#dfdffd"
    }
}
