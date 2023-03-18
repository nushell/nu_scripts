export def main [] {
    # extra desired values for the batman theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1b1d1e"
    # foreground: "#6e6e6e"
    # cursor: "#fcee0b"

    {
        # color for nushell primitives
        separator: "#dadad5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#fff27c"
        empty: "#737074"
        bool: "#dadad5"
        int: "#dadad5"
        filesize: "#dadad5"
        duration: "#dadad5"
        date: "#dadad5"
        range: "#dadad5"
        float: "#dadad5"
        string: "#dadad5"
        nothing: "#dadad5"
        binary: "#dadad5"
        cellpath: "#dadad5"
        row_index: "#fff27c"
        record: "#dadad5"
        list: "#dadad5"
        block: "#dadad5"
        hints: "#505354"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9a999d"
        shape_bool: "#a2a2a5"
        shape_int: "#9a999d"
        shape_float: "#9a999d"
        shape_range: "#feed6c"
        shape_internalcall: "#a2a2a5"
        shape_external: "#615f5e"
        shape_externalarg: "#fff27c"
        shape_literal: "#737074"
        shape_operator: "#f3fd21"
        shape_signature: "#fff27c"
        shape_string: "#c8be46"
        shape_string_interpolation: "#a2a2a5"
        shape_datetime: "#a2a2a5"
        shape_list: "#a2a2a5"
        shape_table: "#909495"
        shape_record: "#a2a2a5"
        shape_block: "#909495"
        shape_filepath: "#615f5e"
        shape_globpattern: "#a2a2a5"
        shape_variable: "#737271"
        shape_flag: "#909495"
        shape_custom: "#c8be46"
        shape_nothing: "#a2a2a5"
    }
}
