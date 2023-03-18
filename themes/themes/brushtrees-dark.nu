export def main [] {
    # extra desired values for the brushtrees_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#485867"
    # foreground: "#b0c5c8"
    # cursor: "#b0c5c8"

    {
        # color for nushell primitives
        separator: "#e3efef"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#87b386"
        empty: "#868cb3"
        bool: "#e3efef"
        int: "#e3efef"
        filesize: "#e3efef"
        duration: "#e3efef"
        date: "#e3efef"
        range: "#e3efef"
        float: "#e3efef"
        string: "#e3efef"
        nothing: "#e3efef"
        binary: "#e3efef"
        cellpath: "#e3efef"
        row_index: "#87b386"
        record: "#e3efef"
        list: "#e3efef"
        block: "#e3efef"
        hints: "#8299a1"

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
