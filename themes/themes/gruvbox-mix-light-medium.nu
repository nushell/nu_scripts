export def main [] {
    # extra desired values for the gruvbox_mix-light-medium theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#fbf1c7"
    # foreground: "#514036"
    # cursor: "#514036"

    {
        # color for nushell primitives
        separator: "#514036"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#72761e"
        empty: "#266b79"
        bool: "#514036"
        int: "#514036"
        filesize: "#514036"
        duration: "#514036"
        date: "#514036"
        range: "#514036"
        float: "#514036"
        string: "#514036"
        nothing: "#514036"
        binary: "#514036"
        cellpath: "#514036"
        row_index: "#72761e"
        record: "#514036"
        list: "#514036"
        block: "#514036"
        hints: "#fbf1c7"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#924f79"
        shape_bool: "#477a5b"
        shape_int: "#924f79"
        shape_float: "#924f79"
        shape_range: "#b4730e"
        shape_internalcall: "#477a5b"
        shape_external: "#477a5b"
        shape_externalarg: "#72761e"
        shape_literal: "#266b79"
        shape_operator: "#b4730e"
        shape_signature: "#72761e"
        shape_string: "#72761e"
        shape_string_interpolation: "#477a5b"
        shape_datetime: "#477a5b"
        shape_list: "#477a5b"
        shape_table: "#266b79"
        shape_record: "#477a5b"
        shape_block: "#266b79"
        shape_filepath: "#477a5b"
        shape_globpattern: "#477a5b"
        shape_variable: "#924f79"
        shape_flag: "#266b79"
        shape_custom: "#72761e"
        shape_nothing: "#477a5b"
    }
}
