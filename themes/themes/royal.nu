export def main [] {
    # extra desired values for the royal theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#100815"
    # foreground: "#514968"
    # cursor: "#514968"

    {
        # color for nushell primitives
        separator: "#9e8cbd"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#2cd946"
        empty: "#6580b0"
        bool: "#9e8cbd"
        int: "#9e8cbd"
        filesize: "#9e8cbd"
        duration: "#9e8cbd"
        date: "#9e8cbd"
        range: "#9e8cbd"
        float: "#9e8cbd"
        string: "#9e8cbd"
        nothing: "#9e8cbd"
        binary: "#9e8cbd"
        cellpath: "#9e8cbd"
        row_index: "#2cd946"
        record: "#9e8cbd"
        list: "#9e8cbd"
        block: "#9e8cbd"
        hints: "#312d3d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a479e3"
        shape_bool: "#acd4eb"
        shape_int: "#a479e3"
        shape_float: "#a479e3"
        shape_range: "#fde83b"
        shape_internalcall: "#acd4eb"
        shape_external: "#8aaabe"
        shape_externalarg: "#2cd946"
        shape_literal: "#6580b0"
        shape_operator: "#b49d27"
        shape_signature: "#2cd946"
        shape_string: "#23801c"
        shape_string_interpolation: "#acd4eb"
        shape_datetime: "#acd4eb"
        shape_list: "#acd4eb"
        shape_table: "#90baf9"
        shape_record: "#acd4eb"
        shape_block: "#90baf9"
        shape_filepath: "#8aaabe"
        shape_globpattern: "#acd4eb"
        shape_variable: "#674d96"
        shape_flag: "#90baf9"
        shape_custom: "#23801c"
        shape_nothing: "#acd4eb"
    }
}
