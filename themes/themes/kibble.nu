export def main [] {
    # extra desired values for the kibble theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0e100a"
    # foreground: "#f7f7f7"
    # cursor: "#f7f7f7"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#6ce05c"
        empty: "#3449d1"
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
        row_index: "#6ce05c"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#5a5a5a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c495f0"
        shape_bool: "#68f2e0"
        shape_int: "#c495f0"
        shape_float: "#c495f0"
        shape_range: "#f3f79e"
        shape_internalcall: "#68f2e0"
        shape_external: "#0798ab"
        shape_externalarg: "#6ce05c"
        shape_literal: "#3449d1"
        shape_operator: "#d8e30e"
        shape_signature: "#6ce05c"
        shape_string: "#29cf13"
        shape_string_interpolation: "#68f2e0"
        shape_datetime: "#68f2e0"
        shape_list: "#68f2e0"
        shape_table: "#97a4f7"
        shape_record: "#68f2e0"
        shape_block: "#97a4f7"
        shape_filepath: "#0798ab"
        shape_globpattern: "#68f2e0"
        shape_variable: "#8400ff"
        shape_flag: "#97a4f7"
        shape_custom: "#29cf13"
        shape_nothing: "#68f2e0"
    }
}
