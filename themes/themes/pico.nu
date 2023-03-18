export def main [] {
    # extra desired values for the pico theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#5f574f"
    # cursor: "#5f574f"

    {
        # color for nushell primitives
        separator: "#fff1e8"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#00e756"
        empty: "#83769c"
        bool: "#fff1e8"
        int: "#fff1e8"
        filesize: "#fff1e8"
        duration: "#fff1e8"
        date: "#fff1e8"
        range: "#fff1e8"
        float: "#fff1e8"
        string: "#fff1e8"
        nothing: "#fff1e8"
        binary: "#fff1e8"
        cellpath: "#fff1e8"
        row_index: "#00e756"
        record: "#fff1e8"
        list: "#fff1e8"
        block: "#fff1e8"
        hints: "#008751"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff77a8"
        shape_bool: "#29adff"
        shape_int: "#ff77a8"
        shape_float: "#ff77a8"
        shape_range: "#fff024"
        shape_internalcall: "#29adff"
        shape_external: "#29adff"
        shape_externalarg: "#00e756"
        shape_literal: "#83769c"
        shape_operator: "#fff024"
        shape_signature: "#00e756"
        shape_string: "#00e756"
        shape_string_interpolation: "#29adff"
        shape_datetime: "#29adff"
        shape_list: "#29adff"
        shape_table: "#83769c"
        shape_record: "#29adff"
        shape_block: "#83769c"
        shape_filepath: "#29adff"
        shape_globpattern: "#29adff"
        shape_variable: "#ff77a8"
        shape_flag: "#83769c"
        shape_custom: "#00e756"
        shape_nothing: "#29adff"
    }
}
