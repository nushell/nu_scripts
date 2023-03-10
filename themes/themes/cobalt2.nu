export def main [] {
    # extra desired values for the cobalt2 theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#132738"
    # foreground: "#ffffff"
    # cursor: "#ffffff"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#3bd01d"
        empty: "#1460d2"
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
        row_index: "#3bd01d"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#555555"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff55ff"
        shape_bool: "#6ae3fa"
        shape_int: "#ff55ff"
        shape_float: "#ff55ff"
        shape_range: "#edc809"
        shape_internalcall: "#6ae3fa"
        shape_external: "#00bbbb"
        shape_externalarg: "#3bd01d"
        shape_literal: "#1460d2"
        shape_operator: "#ffe50a"
        shape_signature: "#3bd01d"
        shape_string: "#38de21"
        shape_string_interpolation: "#6ae3fa"
        shape_datetime: "#6ae3fa"
        shape_list: "#6ae3fa"
        shape_table: "#5555ff"
        shape_record: "#6ae3fa"
        shape_block: "#5555ff"
        shape_filepath: "#00bbbb"
        shape_globpattern: "#6ae3fa"
        shape_variable: "#ff005d"
        shape_flag: "#5555ff"
        shape_custom: "#38de21"
        shape_nothing: "#6ae3fa"
    }
}
