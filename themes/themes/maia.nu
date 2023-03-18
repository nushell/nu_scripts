export def main [] {
    # extra desired values for the maia theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#272827"
    # foreground: "#fdf6e3"
    # cursor: "#16a085"

    {
        # color for nushell primitives
        separator: "#e8e8e8"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8d8f8d"
        empty: "#16a085"
        bool: "#e8e8e8"
        int: "#e8e8e8"
        filesize: "#e8e8e8"
        duration: "#e8e8e8"
        date: "#e8e8e8"
        range: "#e8e8e8"
        float: "#e8e8e8"
        string: "#e8e8e8"
        nothing: "#e8e8e8"
        binary: "#e8e8e8"
        cellpath: "#e8e8e8"
        row_index: "#8d8f8d"
        record: "#e8e8e8"
        list: "#e8e8e8"
        block: "#e8e8e8"
        hints: "#282928"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#487d72"
        shape_bool: "#00d1d1"
        shape_int: "#487d72"
        shape_float: "#487d72"
        shape_range: "#4e524f"
        shape_internalcall: "#00d1d1"
        shape_external: "#00cccc"
        shape_externalarg: "#8d8f8d"
        shape_literal: "#16a085"
        shape_operator: "#4c4f4d"
        shape_signature: "#8d8f8d"
        shape_string: "#7e807e"
        shape_string_interpolation: "#00d1d1"
        shape_datetime: "#00d1d1"
        shape_list: "#00d1d1"
        shape_table: "#13bf9d"
        shape_record: "#00d1d1"
        shape_block: "#13bf9d"
        shape_filepath: "#00cccc"
        shape_globpattern: "#00d1d1"
        shape_variable: "#43746a"
        shape_flag: "#13bf9d"
        shape_custom: "#7e807e"
        shape_nothing: "#00d1d1"
    }
}
