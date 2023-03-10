export def main [] {
    # extra desired values for the selenized_white theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ffffff"
    # foreground: "#474747"
    # cursor: "#474747"

    {
        # color for nushell primitives
        separator: "#282828"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#008400"
        empty: "#0064e4"
        bool: "#282828"
        int: "#282828"
        filesize: "#282828"
        duration: "#282828"
        date: "#282828"
        range: "#282828"
        float: "#282828"
        string: "#282828"
        nothing: "#282828"
        binary: "#282828"
        cellpath: "#282828"
        row_index: "#008400"
        record: "#282828"
        list: "#282828"
        block: "#282828"
        hints: "#cdcdcd"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c7008b"
        shape_bool: "#009a8a"
        shape_int: "#c7008b"
        shape_float: "#c7008b"
        shape_range: "#af8500"
        shape_internalcall: "#009a8a"
        shape_external: "#00ad9c"
        shape_externalarg: "#008400"
        shape_literal: "#0064e4"
        shape_operator: "#c49700"
        shape_signature: "#008400"
        shape_string: "#1d9700"
        shape_string_interpolation: "#009a8a"
        shape_datetime: "#009a8a"
        shape_list: "#009a8a"
        shape_table: "#0054cf"
        shape_record: "#009a8a"
        shape_block: "#0054cf"
        shape_filepath: "#00ad9c"
        shape_globpattern: "#009a8a"
        shape_variable: "#dd0f9d"
        shape_flag: "#0054cf"
        shape_custom: "#1d9700"
        shape_nothing: "#009a8a"
    }
}
