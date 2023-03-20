export def main [] {
    # extra desired values for the codeschool theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#232c31"
    # foreground: "#9ea7a6"
    # cursor: "#9ea7a6"

    {
        # color for nushell primitives
        separator: "#b5d8f6"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#237986"
        empty: "#484d79"
        bool: "#b5d8f6"
        int: "#b5d8f6"
        filesize: "#b5d8f6"
        duration: "#b5d8f6"
        date: "#b5d8f6"
        range: "#b5d8f6"
        float: "#b5d8f6"
        string: "#b5d8f6"
        nothing: "#b5d8f6"
        binary: "#b5d8f6"
        cellpath: "#b5d8f6"
        row_index: "#237986"
        record: "#b5d8f6"
        list: "#b5d8f6"
        block: "#b5d8f6"
        hints: "#3f4944"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c59820"
        shape_bool: "#b02f30"
        shape_int: "#c59820"
        shape_float: "#c59820"
        shape_range: "#a03b1e"
        shape_internalcall: "#b02f30"
        shape_external: "#b02f30"
        shape_externalarg: "#237986"
        shape_literal: "#484d79"
        shape_operator: "#a03b1e"
        shape_signature: "#237986"
        shape_string: "#237986"
        shape_string_interpolation: "#b02f30"
        shape_datetime: "#b02f30"
        shape_list: "#b02f30"
        shape_table: "#484d79"
        shape_record: "#b02f30"
        shape_block: "#484d79"
        shape_filepath: "#b02f30"
        shape_globpattern: "#b02f30"
        shape_variable: "#c59820"
        shape_flag: "#484d79"
        shape_custom: "#237986"
        shape_nothing: "#b02f30"
    }
}
