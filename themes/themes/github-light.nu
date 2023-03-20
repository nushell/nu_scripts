export def main [] {
    # extra desired values for the {{theme}} theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ffffff"
    # foreground: "#24292f"
    # cursor: "#044289"

    {
        # color for nushell primitives
        separator: "#d1d5da"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#22863a"
        empty: "#0366d6"
        bool: "#d1d5da"
        int: "#d1d5da"
        filesize: "#d1d5da"
        duration: "#d1d5da"
        date: "#d1d5da"
        range: "#d1d5da"
        float: "#d1d5da"
        string: "#d1d5da"
        nothing: "#d1d5da"
        binary: "#d1d5da"
        cellpath: "#d1d5da"
        row_index: "#22863a"
        record: "#d1d5da"
        list: "#d1d5da"
        block: "#d1d5da"
        hints: "#959da5"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#5a32a3"
        shape_bool: "#3192aa"
        shape_int: "#5a32a3"
        shape_float: "#5a32a3"
        shape_range: "#b08800"
        shape_internalcall: "#3192aa"
        shape_external: "#0598bc"
        shape_externalarg: "#22863a"
        shape_literal: "#0366d6"
        shape_operator: "#dbab09"
        shape_signature: "#22863a"
        shape_string: "#28a745"
        shape_string_interpolation: "#3192aa"
        shape_datetime: "#3192aa"
        shape_list: "#3192aa"
        shape_table: "#005cc5"
        shape_record: "#3192aa"
        shape_block: "#005cc5"
        shape_filepath: "#0598bc"
        shape_globpattern: "#3192aa"
        shape_variable: "#5a32a3"
        shape_flag: "#005cc5"
        shape_custom: "#28a745"
        shape_nothing: "#3192aa"
    }
}
