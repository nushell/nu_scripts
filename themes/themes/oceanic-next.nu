export def main [] {
    # extra desired values for the oceanic_next theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#121b21"
    # foreground: "#b3b8c3"
    # cursor: "#b3b8c3"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#89bd82"
        empty: "#5486c0"
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
        row_index: "#89bd82"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#52606b"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b77eb8"
        shape_bool: "#50a5a4"
        shape_int: "#b77eb8"
        shape_float: "#b77eb8"
        shape_range: "#f7bd51"
        shape_internalcall: "#50a5a4"
        shape_external: "#50a5a4"
        shape_externalarg: "#89bd82"
        shape_literal: "#5486c0"
        shape_operator: "#f7bd51"
        shape_signature: "#89bd82"
        shape_string: "#89bd82"
        shape_string_interpolation: "#50a5a4"
        shape_datetime: "#50a5a4"
        shape_list: "#50a5a4"
        shape_table: "#5486c0"
        shape_record: "#50a5a4"
        shape_block: "#5486c0"
        shape_filepath: "#50a5a4"
        shape_globpattern: "#50a5a4"
        shape_variable: "#b77eb8"
        shape_flag: "#5486c0"
        shape_custom: "#89bd82"
        shape_nothing: "#50a5a4"
    }
}
