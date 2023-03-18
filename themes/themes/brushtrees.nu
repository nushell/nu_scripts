export def main [] {
    # extra desired values for the brushtrees theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#e3efef"
    # foreground: "#6d828e"
    # cursor: "#6d828e"

    {
        # color for nushell primitives
        separator: "#485867"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#87b386"
        empty: "#868cb3"
        bool: "#485867"
        int: "#485867"
        filesize: "#485867"
        duration: "#485867"
        date: "#485867"
        range: "#485867"
        float: "#485867"
        string: "#485867"
        nothing: "#485867"
        binary: "#485867"
        cellpath: "#485867"
        row_index: "#87b386"
        record: "#485867"
        list: "#485867"
        block: "#485867"
        hints: "#98afb5"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b386b2"
        shape_bool: "#86b3b3"
        shape_int: "#b386b2"
        shape_float: "#b386b2"
        shape_range: "#aab386"
        shape_internalcall: "#86b3b3"
        shape_external: "#86b3b3"
        shape_externalarg: "#87b386"
        shape_literal: "#868cb3"
        shape_operator: "#aab386"
        shape_signature: "#87b386"
        shape_string: "#87b386"
        shape_string_interpolation: "#86b3b3"
        shape_datetime: "#86b3b3"
        shape_list: "#86b3b3"
        shape_table: "#868cb3"
        shape_record: "#86b3b3"
        shape_block: "#868cb3"
        shape_filepath: "#86b3b3"
        shape_globpattern: "#86b3b3"
        shape_variable: "#b386b2"
        shape_flag: "#868cb3"
        shape_custom: "#87b386"
        shape_nothing: "#86b3b3"
    }
}
