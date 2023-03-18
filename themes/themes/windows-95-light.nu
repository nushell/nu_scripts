export def main [] {
    # extra desired values for the windows_95-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#fcfcfc"
    # foreground: "#545454"
    # cursor: "#545454"

    {
        # color for nushell primitives
        separator: "#000000"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#00a800"
        empty: "#0000a8"
        bool: "#000000"
        int: "#000000"
        filesize: "#000000"
        duration: "#000000"
        date: "#000000"
        range: "#000000"
        float: "#000000"
        string: "#000000"
        nothing: "#000000"
        binary: "#000000"
        cellpath: "#000000"
        row_index: "#00a800"
        record: "#000000"
        list: "#000000"
        block: "#000000"
        hints: "#a8a8a8"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a800a8"
        shape_bool: "#00a8a8"
        shape_int: "#a800a8"
        shape_float: "#a800a8"
        shape_range: "#a85400"
        shape_internalcall: "#00a8a8"
        shape_external: "#00a8a8"
        shape_externalarg: "#00a800"
        shape_literal: "#0000a8"
        shape_operator: "#a85400"
        shape_signature: "#00a800"
        shape_string: "#00a800"
        shape_string_interpolation: "#00a8a8"
        shape_datetime: "#00a8a8"
        shape_list: "#00a8a8"
        shape_table: "#0000a8"
        shape_record: "#00a8a8"
        shape_block: "#0000a8"
        shape_filepath: "#00a8a8"
        shape_globpattern: "#00a8a8"
        shape_variable: "#a800a8"
        shape_flag: "#0000a8"
        shape_custom: "#00a800"
        shape_nothing: "#00a8a8"
    }
}
