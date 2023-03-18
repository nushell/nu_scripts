export def main [] {
    # extra desired values for the gooey theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0d101b"
    # foreground: "#ebeef9"
    # cursor: "#ebeef9"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a5ffe1"
        empty: "#58b6ca"
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
        row_index: "#a5ffe1"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#1f222d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#97bbf7"
        shape_bool: "#c0b7f9"
        shape_int: "#97bbf7"
        shape_float: "#97bbf7"
        shape_range: "#f99170"
        shape_internalcall: "#c0b7f9"
        shape_external: "#8d84c6"
        shape_externalarg: "#a5ffe1"
        shape_literal: "#58b6ca"
        shape_operator: "#c65e3d"
        shape_signature: "#a5ffe1"
        shape_string: "#72ccae"
        shape_string_interpolation: "#c0b7f9"
        shape_datetime: "#c0b7f9"
        shape_list: "#c0b7f9"
        shape_table: "#8be9fd"
        shape_record: "#c0b7f9"
        shape_block: "#8be9fd"
        shape_filepath: "#8d84c6"
        shape_globpattern: "#c0b7f9"
        shape_variable: "#6488c4"
        shape_flag: "#8be9fd"
        shape_custom: "#72ccae"
        shape_nothing: "#c0b7f9"
    }
}
