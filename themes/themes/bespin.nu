export def main [] {
    # extra desired values for the bespin theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#28211c"
    # foreground: "#8a8986"
    # cursor: "#8a8986"

    {
        # color for nushell primitives
        separator: "#baae9e"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#54be0d"
        empty: "#5ea6ea"
        bool: "#baae9e"
        int: "#baae9e"
        filesize: "#baae9e"
        duration: "#baae9e"
        date: "#baae9e"
        range: "#baae9e"
        float: "#baae9e"
        string: "#baae9e"
        nothing: "#baae9e"
        binary: "#baae9e"
        cellpath: "#baae9e"
        row_index: "#54be0d"
        record: "#baae9e"
        list: "#baae9e"
        block: "#baae9e"
        hints: "#666666"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9b859d"
        shape_bool: "#afc4db"
        shape_int: "#9b859d"
        shape_float: "#9b859d"
        shape_range: "#f9ee98"
        shape_internalcall: "#afc4db"
        shape_external: "#afc4db"
        shape_externalarg: "#54be0d"
        shape_literal: "#5ea6ea"
        shape_operator: "#f9ee98"
        shape_signature: "#54be0d"
        shape_string: "#54be0d"
        shape_string_interpolation: "#afc4db"
        shape_datetime: "#afc4db"
        shape_list: "#afc4db"
        shape_table: "#5ea6ea"
        shape_record: "#afc4db"
        shape_block: "#5ea6ea"
        shape_filepath: "#afc4db"
        shape_globpattern: "#afc4db"
        shape_variable: "#9b859d"
        shape_flag: "#5ea6ea"
        shape_custom: "#54be0d"
        shape_nothing: "#afc4db"
    }
}
