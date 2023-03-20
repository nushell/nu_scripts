export def main [] {
    # extra desired values for the elemental theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#22211d"
    # foreground: "#807a74"
    # cursor: "#807a74"

    {
        # color for nushell primitives
        separator: "#fff1e9"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#61e070"
        empty: "#497f7d"
        bool: "#fff1e9"
        int: "#fff1e9"
        filesize: "#fff1e9"
        duration: "#fff1e9"
        date: "#fff1e9"
        range: "#fff1e9"
        float: "#fff1e9"
        string: "#fff1e9"
        nothing: "#fff1e9"
        binary: "#fff1e9"
        cellpath: "#fff1e9"
        row_index: "#61e070"
        record: "#fff1e9"
        list: "#fff1e9"
        block: "#fff1e9"
        hints: "#555445"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#cd7c54"
        shape_bool: "#59d599"
        shape_int: "#cd7c54"
        shape_float: "#cd7c54"
        shape_range: "#d69927"
        shape_internalcall: "#59d599"
        shape_external: "#387f58"
        shape_externalarg: "#61e070"
        shape_literal: "#497f7d"
        shape_operator: "#7f7111"
        shape_signature: "#61e070"
        shape_string: "#479a43"
        shape_string_interpolation: "#59d599"
        shape_datetime: "#59d599"
        shape_list: "#59d599"
        shape_table: "#79d9d9"
        shape_record: "#59d599"
        shape_block: "#79d9d9"
        shape_filepath: "#387f58"
        shape_globpattern: "#59d599"
        shape_variable: "#7f4e2f"
        shape_flag: "#79d9d9"
        shape_custom: "#479a43"
        shape_nothing: "#59d599"
    }
}
