export def main [] {
    # extra desired values for the one_half-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#fafafa"
    # foreground: "#383a42"
    # cursor: "#383a42"

    {
        # color for nushell primitives
        separator: "#fafafa"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#40a14f"
        empty: "#0184bc"
        bool: "#fafafa"
        int: "#fafafa"
        filesize: "#fafafa"
        duration: "#fafafa"
        date: "#fafafa"
        range: "#fafafa"
        float: "#fafafa"
        string: "#fafafa"
        nothing: "#fafafa"
        binary: "#fafafa"
        cellpath: "#fafafa"
        row_index: "#40a14f"
        record: "#fafafa"
        list: "#fafafa"
        block: "#fafafa"
        hints: "#383a42"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a626a4"
        shape_bool: "#0997b3"
        shape_int: "#a626a4"
        shape_float: "#a626a4"
        shape_range: "#c18401"
        shape_internalcall: "#0997b3"
        shape_external: "#0997b3"
        shape_externalarg: "#40a14f"
        shape_literal: "#0184bc"
        shape_operator: "#c18401"
        shape_signature: "#40a14f"
        shape_string: "#40a14f"
        shape_string_interpolation: "#0997b3"
        shape_datetime: "#0997b3"
        shape_list: "#0997b3"
        shape_table: "#0184bc"
        shape_record: "#0997b3"
        shape_block: "#0184bc"
        shape_filepath: "#0997b3"
        shape_globpattern: "#0997b3"
        shape_variable: "#a626a4"
        shape_flag: "#0184bc"
        shape_custom: "#40a14f"
        shape_nothing: "#0997b3"
    }
}
