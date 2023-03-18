export def main [] {
    # extra desired values for the ic_green-ppl theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#3a3d3f"
    # foreground: "#d9efd3"
    # cursor: "#d9efd3"

    {
        # color for nushell primitives
        separator: "#daefd0"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#9fff6d"
        empty: "#149b45"
        bool: "#daefd0"
        int: "#daefd0"
        filesize: "#daefd0"
        duration: "#daefd0"
        date: "#daefd0"
        range: "#daefd0"
        float: "#daefd0"
        string: "#daefd0"
        nothing: "#daefd0"
        binary: "#daefd0"
        cellpath: "#daefd0"
        row_index: "#9fff6d"
        record: "#daefd0"
        list: "#daefd0"
        block: "#daefd0"
        hints: "#032710"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#50ff3e"
        shape_bool: "#22ff71"
        shape_int: "#50ff3e"
        shape_float: "#50ff3e"
        shape_range: "#d2ff6d"
        shape_internalcall: "#22ff71"
        shape_external: "#2cb868"
        shape_externalarg: "#9fff6d"
        shape_literal: "#149b45"
        shape_operator: "#659b25"
        shape_signature: "#9fff6d"
        shape_string: "#339c24"
        shape_string_interpolation: "#22ff71"
        shape_datetime: "#22ff71"
        shape_list: "#22ff71"
        shape_table: "#72ffb5"
        shape_record: "#22ff71"
        shape_block: "#72ffb5"
        shape_filepath: "#2cb868"
        shape_globpattern: "#22ff71"
        shape_variable: "#53b82c"
        shape_flag: "#72ffb5"
        shape_custom: "#339c24"
        shape_nothing: "#22ff71"
    }
}
