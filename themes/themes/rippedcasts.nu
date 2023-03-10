export def main [] {
    # extra desired values for the rippedcasts theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2b2b2b"
    # foreground: "#ffffff"
    # cursor: "#ffffff"

    {
        # color for nushell primitives
        separator: "#e5e5e5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#bcee68"
        empty: "#75a5b0"
        bool: "#e5e5e5"
        int: "#e5e5e5"
        filesize: "#e5e5e5"
        duration: "#e5e5e5"
        date: "#e5e5e5"
        range: "#e5e5e5"
        float: "#e5e5e5"
        string: "#e5e5e5"
        nothing: "#e5e5e5"
        binary: "#e5e5e5"
        cellpath: "#e5e5e5"
        row_index: "#bcee68"
        record: "#e5e5e5"
        list: "#e5e5e5"
        block: "#e5e5e5"
        hints: "#666666"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#e500e5"
        shape_bool: "#8c9bc4"
        shape_int: "#e500e5"
        shape_float: "#e500e5"
        shape_range: "#e5e500"
        shape_internalcall: "#8c9bc4"
        shape_external: "#5a647e"
        shape_externalarg: "#bcee68"
        shape_literal: "#75a5b0"
        shape_operator: "#bfbb1f"
        shape_signature: "#bcee68"
        shape_string: "#a8ff60"
        shape_string_interpolation: "#8c9bc4"
        shape_datetime: "#8c9bc4"
        shape_list: "#8c9bc4"
        shape_table: "#86bdc9"
        shape_record: "#8c9bc4"
        shape_block: "#86bdc9"
        shape_filepath: "#5a647e"
        shape_globpattern: "#8c9bc4"
        shape_variable: "#ff73fd"
        shape_flag: "#86bdc9"
        shape_custom: "#a8ff60"
        shape_nothing: "#8c9bc4"
    }
}
