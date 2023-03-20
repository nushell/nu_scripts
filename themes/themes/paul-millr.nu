export def main [] {
    # extra desired values for the paul_millr theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#f2f2f2"
    # cursor: "#f2f2f2"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#66ff66"
        empty: "#396bd7"
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
        row_index: "#66ff66"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#666666"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#db67e6"
        shape_bool: "#7adff2"
        shape_int: "#db67e6"
        shape_float: "#db67e6"
        shape_range: "#f3d64e"
        shape_internalcall: "#7adff2"
        shape_external: "#66ccff"
        shape_externalarg: "#66ff66"
        shape_literal: "#396bd7"
        shape_operator: "#d3bf00"
        shape_signature: "#66ff66"
        shape_string: "#79ff0f"
        shape_string_interpolation: "#7adff2"
        shape_datetime: "#7adff2"
        shape_list: "#7adff2"
        shape_table: "#709aed"
        shape_record: "#7adff2"
        shape_block: "#709aed"
        shape_filepath: "#66ccff"
        shape_globpattern: "#7adff2"
        shape_variable: "#b449be"
        shape_flag: "#709aed"
        shape_custom: "#79ff0f"
        shape_nothing: "#7adff2"
    }
}
