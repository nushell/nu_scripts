export def main [] {
    # extra desired values for the darkside theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#222324"
    # foreground: "#bababa"
    # cursor: "#bababa"

    {
        # color for nushell primitives
        separator: "#bababa"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#77b869"
        empty: "#1c98e8"
        bool: "#bababa"
        int: "#bababa"
        filesize: "#bababa"
        duration: "#bababa"
        date: "#bababa"
        range: "#bababa"
        float: "#bababa"
        string: "#bababa"
        nothing: "#bababa"
        binary: "#bababa"
        cellpath: "#bababa"
        row_index: "#77b869"
        record: "#bababa"
        list: "#bababa"
        block: "#bababa"
        hints: "#000000"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#957bbe"
        shape_bool: "#3d97e2"
        shape_int: "#957bbe"
        shape_float: "#957bbe"
        shape_range: "#efd64b"
        shape_internalcall: "#3d97e2"
        shape_external: "#1c98e8"
        shape_externalarg: "#77b869"
        shape_literal: "#1c98e8"
        shape_operator: "#f2d42c"
        shape_signature: "#77b869"
        shape_string: "#68c256"
        shape_string_interpolation: "#3d97e2"
        shape_datetime: "#3d97e2"
        shape_list: "#3d97e2"
        shape_table: "#387cd3"
        shape_record: "#3d97e2"
        shape_block: "#387cd3"
        shape_filepath: "#1c98e8"
        shape_globpattern: "#3d97e2"
        shape_variable: "#8e69c9"
        shape_flag: "#387cd3"
        shape_custom: "#68c256"
        shape_nothing: "#3d97e2"
    }
}
