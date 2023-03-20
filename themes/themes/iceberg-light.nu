export def main [] {
    # extra desired values for the iceberg_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#e8e9ec"
    # foreground: "#33374c"
    # cursor: "#33374c"

    {
        # color for nushell primitives
        separator: "#262a3f"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#598030"
        empty: "#2d539e"
        bool: "#262a3f"
        int: "#262a3f"
        filesize: "#262a3f"
        duration: "#262a3f"
        date: "#262a3f"
        range: "#262a3f"
        float: "#262a3f"
        string: "#262a3f"
        nothing: "#262a3f"
        binary: "#262a3f"
        cellpath: "#262a3f"
        row_index: "#598030"
        record: "#262a3f"
        list: "#262a3f"
        block: "#262a3f"
        hints: "#8389a3"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#6845ad"
        shape_bool: "#327698"
        shape_int: "#6845ad"
        shape_float: "#6845ad"
        shape_range: "#b6662d"
        shape_internalcall: "#327698"
        shape_external: "#3f83a6"
        shape_externalarg: "#598030"
        shape_literal: "#2d539e"
        shape_operator: "#c57339"
        shape_signature: "#598030"
        shape_string: "#668e3d"
        shape_string_interpolation: "#327698"
        shape_datetime: "#327698"
        shape_list: "#327698"
        shape_table: "#22478e"
        shape_record: "#327698"
        shape_block: "#22478e"
        shape_filepath: "#3f83a6"
        shape_globpattern: "#327698"
        shape_variable: "#7759b4"
        shape_flag: "#22478e"
        shape_custom: "#668e3d"
        shape_nothing: "#327698"
    }
}
