export def main [] {
    # extra desired values for the cupertino theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ffffff"
    # foreground: "#404040"
    # cursor: "#404040"

    {
        # color for nushell primitives
        separator: "#5e5e5e"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#007400"
        empty: "#0000ff"
        bool: "#5e5e5e"
        int: "#5e5e5e"
        filesize: "#5e5e5e"
        duration: "#5e5e5e"
        date: "#5e5e5e"
        range: "#5e5e5e"
        float: "#5e5e5e"
        string: "#5e5e5e"
        nothing: "#5e5e5e"
        binary: "#5e5e5e"
        cellpath: "#5e5e5e"
        row_index: "#007400"
        record: "#5e5e5e"
        list: "#5e5e5e"
        block: "#5e5e5e"
        hints: "#808080"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a90d91"
        shape_bool: "#318495"
        shape_int: "#a90d91"
        shape_float: "#a90d91"
        shape_range: "#826b28"
        shape_internalcall: "#318495"
        shape_external: "#318495"
        shape_externalarg: "#007400"
        shape_literal: "#0000ff"
        shape_operator: "#826b28"
        shape_signature: "#007400"
        shape_string: "#007400"
        shape_string_interpolation: "#318495"
        shape_datetime: "#318495"
        shape_list: "#318495"
        shape_table: "#0000ff"
        shape_record: "#318495"
        shape_block: "#0000ff"
        shape_filepath: "#318495"
        shape_globpattern: "#318495"
        shape_variable: "#a90d91"
        shape_flag: "#0000ff"
        shape_custom: "#007400"
        shape_nothing: "#318495"
    }
}
