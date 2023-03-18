export def main [] {
    # extra desired values for the misterioso theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2d3743"
    # foreground: "#e1e1e0"
    # cursor: "#e1e1e0"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#74cd68"
        empty: "#338f86"
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
        row_index: "#74cd68"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#555555"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff37ff"
        shape_bool: "#00ede1"
        shape_int: "#ff37ff"
        shape_float: "#ff37ff"
        shape_range: "#ffb929"
        shape_internalcall: "#00ede1"
        shape_external: "#23d7d7"
        shape_externalarg: "#74cd68"
        shape_literal: "#338f86"
        shape_operator: "#ffad29"
        shape_signature: "#74cd68"
        shape_string: "#74af68"
        shape_string_interpolation: "#00ede1"
        shape_datetime: "#00ede1"
        shape_list: "#00ede1"
        shape_table: "#23d7d7"
        shape_record: "#00ede1"
        shape_block: "#23d7d7"
        shape_filepath: "#23d7d7"
        shape_globpattern: "#00ede1"
        shape_variable: "#9414e6"
        shape_flag: "#23d7d7"
        shape_custom: "#74af68"
        shape_nothing: "#00ede1"
    }
}
