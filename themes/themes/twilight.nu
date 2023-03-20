export def main [] {
    # extra desired values for the twilight theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1e1e1e"
    # foreground: "#a7a7a7"
    # cursor: "#a7a7a7"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8f9d6a"
        empty: "#7587a6"
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
        row_index: "#8f9d6a"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#5f5a60"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9b859d"
        shape_bool: "#afc4db"
        shape_int: "#9b859d"
        shape_float: "#9b859d"
        shape_range: "#f9ee98"
        shape_internalcall: "#afc4db"
        shape_external: "#afc4db"
        shape_externalarg: "#8f9d6a"
        shape_literal: "#7587a6"
        shape_operator: "#f9ee98"
        shape_signature: "#8f9d6a"
        shape_string: "#8f9d6a"
        shape_string_interpolation: "#afc4db"
        shape_datetime: "#afc4db"
        shape_list: "#afc4db"
        shape_table: "#7587a6"
        shape_record: "#afc4db"
        shape_block: "#7587a6"
        shape_filepath: "#afc4db"
        shape_globpattern: "#afc4db"
        shape_variable: "#9b859d"
        shape_flag: "#7587a6"
        shape_custom: "#8f9d6a"
        shape_nothing: "#afc4db"
    }
}
