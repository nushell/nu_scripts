export def main [] {
    # extra desired values for the hemisu_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#efefef"
    # foreground: "#444444"
    # cursor: "#ff0054"

    {
        # color for nushell primitives
        separator: "#bababa"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#9cc700"
        empty: "#538091"
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
        row_index: "#9cc700"
        record: "#bababa"
        list: "#bababa"
        block: "#bababa"
        hints: "#999999"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a184a4"
        shape_bool: "#85b2aa"
        shape_int: "#a184a4"
        shape_float: "#a184a4"
        shape_range: "#947555"
        shape_internalcall: "#85b2aa"
        shape_external: "#538091"
        shape_externalarg: "#9cc700"
        shape_literal: "#538091"
        shape_operator: "#503d15"
        shape_signature: "#9cc700"
        shape_string: "#739100"
        shape_string_interpolation: "#85b2aa"
        shape_datetime: "#85b2aa"
        shape_list: "#85b2aa"
        shape_table: "#9db3cd"
        shape_record: "#85b2aa"
        shape_block: "#9db3cd"
        shape_filepath: "#538091"
        shape_globpattern: "#85b2aa"
        shape_variable: "#5b345e"
        shape_flag: "#9db3cd"
        shape_custom: "#739100"
        shape_nothing: "#85b2aa"
    }
}
