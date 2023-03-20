export def main [] {
    # extra desired values for the tempus_winter theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#202427"
    # foreground: "#8da3b8"
    # cursor: "#8da3b8"

    {
        # color for nushell primitives
        separator: "#8da3b8"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#00a854"
        empty: "#798fd7"
        bool: "#8da3b8"
        int: "#8da3b8"
        filesize: "#8da3b8"
        duration: "#8da3b8"
        date: "#8da3b8"
        range: "#8da3b8"
        float: "#8da3b8"
        string: "#8da3b8"
        nothing: "#8da3b8"
        binary: "#8da3b8"
        cellpath: "#8da3b8"
        row_index: "#00a854"
        record: "#8da3b8"
        list: "#8da3b8"
        block: "#8da3b8"
        hints: "#292b35"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c874c2"
        shape_bool: "#1ba2a0"
        shape_int: "#c874c2"
        shape_float: "#c874c2"
        shape_range: "#ad8e4b"
        shape_internalcall: "#1ba2a0"
        shape_external: "#4fa090"
        shape_externalarg: "#00a854"
        shape_literal: "#798fd7"
        shape_operator: "#959721"
        shape_signature: "#00a854"
        shape_string: "#49a61d"
        shape_string_interpolation: "#1ba2a0"
        shape_datetime: "#1ba2a0"
        shape_list: "#1ba2a0"
        shape_table: "#309dc1"
        shape_record: "#1ba2a0"
        shape_block: "#309dc1"
        shape_filepath: "#4fa090"
        shape_globpattern: "#1ba2a0"
        shape_variable: "#cd7b7e"
        shape_flag: "#309dc1"
        shape_custom: "#49a61d"
        shape_nothing: "#1ba2a0"
    }
}
