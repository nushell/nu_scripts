export def main [] {
    # extra desired values for the ibm3270 theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#fdfdfd"
    # cursor: "#fdfdfd"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7ed684"
        empty: "#7890f0"
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
        row_index: "#7ed684"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#888888"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#efb3e3"
        shape_bool: "#9ce2e2"
        shape_int: "#efb3e3"
        shape_float: "#efb3e3"
        shape_range: "#efe28b"
        shape_internalcall: "#9ce2e2"
        shape_external: "#54e4e4"
        shape_externalarg: "#7ed684"
        shape_literal: "#7890f0"
        shape_operator: "#f0d824"
        shape_signature: "#7ed684"
        shape_string: "#24d830"
        shape_string_interpolation: "#9ce2e2"
        shape_datetime: "#9ce2e2"
        shape_list: "#9ce2e2"
        shape_table: "#b3bfef"
        shape_record: "#9ce2e2"
        shape_block: "#b3bfef"
        shape_filepath: "#54e4e4"
        shape_globpattern: "#9ce2e2"
        shape_variable: "#f078d8"
        shape_flag: "#b3bfef"
        shape_custom: "#24d830"
        shape_nothing: "#9ce2e2"
    }
}
