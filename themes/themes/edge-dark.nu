export def main [] {
    # extra desired values for the edge_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#262729"
    # foreground: "#b7bec9"
    # cursor: "#b7bec9"

    {
        # color for nushell primitives
        separator: "#3e4249"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a1bf78"
        empty: "#73b3e7"
        bool: "#3e4249"
        int: "#3e4249"
        filesize: "#3e4249"
        duration: "#3e4249"
        date: "#3e4249"
        range: "#3e4249"
        float: "#3e4249"
        string: "#3e4249"
        nothing: "#3e4249"
        binary: "#3e4249"
        cellpath: "#3e4249"
        row_index: "#a1bf78"
        record: "#3e4249"
        list: "#3e4249"
        block: "#3e4249"
        hints: "#3e4249"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d390e7"
        shape_bool: "#5ebaa5"
        shape_int: "#d390e7"
        shape_float: "#d390e7"
        shape_range: "#dbb774"
        shape_internalcall: "#5ebaa5"
        shape_external: "#5ebaa5"
        shape_externalarg: "#a1bf78"
        shape_literal: "#73b3e7"
        shape_operator: "#dbb774"
        shape_signature: "#a1bf78"
        shape_string: "#a1bf78"
        shape_string_interpolation: "#5ebaa5"
        shape_datetime: "#5ebaa5"
        shape_list: "#5ebaa5"
        shape_table: "#73b3e7"
        shape_record: "#5ebaa5"
        shape_block: "#73b3e7"
        shape_filepath: "#5ebaa5"
        shape_globpattern: "#5ebaa5"
        shape_variable: "#d390e7"
        shape_flag: "#73b3e7"
        shape_custom: "#a1bf78"
        shape_nothing: "#5ebaa5"
    }
}
