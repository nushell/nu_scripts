export def main [] {
    # extra desired values for the farin theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1e1e1e"
    # foreground: "#aaaaaa"
    # cursor: "#aaaaaa"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#44ff88"
        empty: "#1155ff"
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
        row_index: "#44ff88"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#666666"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#dd66ff"
        shape_bool: "#66ffdd"
        shape_int: "#dd66ff"
        shape_float: "#dd66ff"
        shape_range: "#ffdd66"
        shape_internalcall: "#66ffdd"
        shape_external: "#00ffbb"
        shape_externalarg: "#44ff88"
        shape_literal: "#1155ff"
        shape_operator: "#ffbb33"
        shape_signature: "#44ff88"
        shape_string: "#11ff55"
        shape_string_interpolation: "#66ffdd"
        shape_datetime: "#66ffdd"
        shape_list: "#66ffdd"
        shape_table: "#4488ff"
        shape_record: "#66ffdd"
        shape_block: "#4488ff"
        shape_filepath: "#00ffbb"
        shape_globpattern: "#66ffdd"
        shape_variable: "#ed53c9"
        shape_flag: "#4488ff"
        shape_custom: "#11ff55"
        shape_nothing: "#66ffdd"
    }
}
