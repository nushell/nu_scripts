export def main [] {
    # extra desired values for the novel theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#dfdbc3"
    # foreground: "#3b2322"
    # cursor: "#3b2322"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#009600"
        empty: "#0000cc"
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
        row_index: "#009600"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#808080"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#cc00cc"
        shape_bool: "#0087cc"
        shape_int: "#cc00cc"
        shape_float: "#cc00cc"
        shape_range: "#d06b00"
        shape_internalcall: "#0087cc"
        shape_external: "#0087cc"
        shape_externalarg: "#009600"
        shape_literal: "#0000cc"
        shape_operator: "#d06b00"
        shape_signature: "#009600"
        shape_string: "#009600"
        shape_string_interpolation: "#0087cc"
        shape_datetime: "#0087cc"
        shape_list: "#0087cc"
        shape_table: "#0000cc"
        shape_record: "#0087cc"
        shape_block: "#0000cc"
        shape_filepath: "#0087cc"
        shape_globpattern: "#0087cc"
        shape_variable: "#cc00cc"
        shape_flag: "#0000cc"
        shape_custom: "#009600"
        shape_nothing: "#0087cc"
    }
}
