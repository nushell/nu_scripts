export def main [] {
    # extra desired values for the tempus_dawn theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#eff0f2"
    # foreground: "#4a4b4e"
    # cursor: "#4a4b4e"

    {
        # color for nushell primitives
        separator: "#eff0f2"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#1a7608"
        empty: "#4b529a"
        bool: "#eff0f2"
        int: "#eff0f2"
        filesize: "#eff0f2"
        duration: "#eff0f2"
        date: "#eff0f2"
        range: "#eff0f2"
        float: "#eff0f2"
        string: "#eff0f2"
        nothing: "#eff0f2"
        binary: "#eff0f2"
        cellpath: "#eff0f2"
        row_index: "#1a7608"
        record: "#eff0f2"
        list: "#eff0f2"
        block: "#eff0f2"
        hints: "#686565"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8e47a8"
        shape_bool: "#106e8c"
        shape_int: "#8e47a8"
        shape_float: "#8e47a8"
        shape_range: "#8d5b0a"
        shape_internalcall: "#106e8c"
        shape_external: "#086784"
        shape_externalarg: "#1a7608"
        shape_literal: "#4b529a"
        shape_operator: "#745300"
        shape_signature: "#1a7608"
        shape_string: "#206620"
        shape_string_interpolation: "#106e8c"
        shape_datetime: "#106e8c"
        shape_list: "#106e8c"
        shape_table: "#5c5bb2"
        shape_record: "#106e8c"
        shape_block: "#5c5bb2"
        shape_filepath: "#086784"
        shape_globpattern: "#106e8c"
        shape_variable: "#8d377e"
        shape_flag: "#5c5bb2"
        shape_custom: "#206620"
        shape_nothing: "#106e8c"
    }
}
