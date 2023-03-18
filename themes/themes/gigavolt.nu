export def main [] {
    # extra desired values for the gigavolt theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#202126"
    # foreground: "#e9e7e1"
    # cursor: "#e9e7e1"

    {
        # color for nushell primitives
        separator: "#f2fbff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#f2e6a9"
        empty: "#40bfff"
        bool: "#f2fbff"
        int: "#f2fbff"
        filesize: "#f2fbff"
        duration: "#f2fbff"
        date: "#f2fbff"
        range: "#f2fbff"
        float: "#f2fbff"
        string: "#f2fbff"
        nothing: "#f2fbff"
        binary: "#f2fbff"
        cellpath: "#f2fbff"
        row_index: "#f2e6a9"
        record: "#f2fbff"
        list: "#f2fbff"
        block: "#f2fbff"
        hints: "#a1d2e6"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ae94f9"
        shape_bool: "#fb6acb"
        shape_int: "#ae94f9"
        shape_float: "#ae94f9"
        shape_range: "#ffdc2d"
        shape_internalcall: "#fb6acb"
        shape_external: "#fb6acb"
        shape_externalarg: "#f2e6a9"
        shape_literal: "#40bfff"
        shape_operator: "#ffdc2d"
        shape_signature: "#f2e6a9"
        shape_string: "#f2e6a9"
        shape_string_interpolation: "#fb6acb"
        shape_datetime: "#fb6acb"
        shape_list: "#fb6acb"
        shape_table: "#40bfff"
        shape_record: "#fb6acb"
        shape_block: "#40bfff"
        shape_filepath: "#fb6acb"
        shape_globpattern: "#fb6acb"
        shape_variable: "#ae94f9"
        shape_flag: "#40bfff"
        shape_custom: "#f2e6a9"
        shape_nothing: "#fb6acb"
    }
}
