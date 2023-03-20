export def main [] {
    # extra desired values for the windows_95 theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#a8a8a8"
    # cursor: "#a8a8a8"

    {
        # color for nushell primitives
        separator: "#fcfcfc"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#54fc54"
        empty: "#5454fc"
        bool: "#fcfcfc"
        int: "#fcfcfc"
        filesize: "#fcfcfc"
        duration: "#fcfcfc"
        date: "#fcfcfc"
        range: "#fcfcfc"
        float: "#fcfcfc"
        string: "#fcfcfc"
        nothing: "#fcfcfc"
        binary: "#fcfcfc"
        cellpath: "#fcfcfc"
        row_index: "#54fc54"
        record: "#fcfcfc"
        list: "#fcfcfc"
        block: "#fcfcfc"
        hints: "#545454"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#fc54fc"
        shape_bool: "#54fcfc"
        shape_int: "#fc54fc"
        shape_float: "#fc54fc"
        shape_range: "#fcfc54"
        shape_internalcall: "#54fcfc"
        shape_external: "#54fcfc"
        shape_externalarg: "#54fc54"
        shape_literal: "#5454fc"
        shape_operator: "#fcfc54"
        shape_signature: "#54fc54"
        shape_string: "#54fc54"
        shape_string_interpolation: "#54fcfc"
        shape_datetime: "#54fcfc"
        shape_list: "#54fcfc"
        shape_table: "#5454fc"
        shape_record: "#54fcfc"
        shape_block: "#5454fc"
        shape_filepath: "#54fcfc"
        shape_globpattern: "#54fcfc"
        shape_variable: "#fc54fc"
        shape_flag: "#5454fc"
        shape_custom: "#54fc54"
        shape_nothing: "#54fcfc"
    }
}
