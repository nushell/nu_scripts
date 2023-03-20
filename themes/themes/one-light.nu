export def main [] {
    # extra desired values for the one_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#fafafa"
    # foreground: "#383a42"
    # cursor: "#383a42"

    {
        # color for nushell primitives
        separator: "#090a0b"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#50a14f"
        empty: "#4078f2"
        bool: "#090a0b"
        int: "#090a0b"
        filesize: "#090a0b"
        duration: "#090a0b"
        date: "#090a0b"
        range: "#090a0b"
        float: "#090a0b"
        string: "#090a0b"
        nothing: "#090a0b"
        binary: "#090a0b"
        cellpath: "#090a0b"
        row_index: "#50a14f"
        record: "#090a0b"
        list: "#090a0b"
        block: "#090a0b"
        hints: "#a0a1a7"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a626a4"
        shape_bool: "#0184bc"
        shape_int: "#a626a4"
        shape_float: "#a626a4"
        shape_range: "#c18401"
        shape_internalcall: "#0184bc"
        shape_external: "#0184bc"
        shape_externalarg: "#50a14f"
        shape_literal: "#4078f2"
        shape_operator: "#c18401"
        shape_signature: "#50a14f"
        shape_string: "#50a14f"
        shape_string_interpolation: "#0184bc"
        shape_datetime: "#0184bc"
        shape_list: "#0184bc"
        shape_table: "#4078f2"
        shape_record: "#0184bc"
        shape_block: "#4078f2"
        shape_filepath: "#0184bc"
        shape_globpattern: "#0184bc"
        shape_variable: "#a626a4"
        shape_flag: "#4078f2"
        shape_custom: "#50a14f"
        shape_nothing: "#0184bc"
    }
}
