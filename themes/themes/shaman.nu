export def main [] {
    # extra desired values for the shaman theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#001015"
    # foreground: "#405555"
    # cursor: "#405555"

    {
        # color for nushell primitives
        separator: "#58fbd6"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#2aea5e"
        empty: "#449a86"
        bool: "#58fbd6"
        int: "#58fbd6"
        filesize: "#58fbd6"
        duration: "#58fbd6"
        date: "#58fbd6"
        range: "#58fbd6"
        float: "#58fbd6"
        string: "#58fbd6"
        nothing: "#58fbd6"
        binary: "#58fbd6"
        cellpath: "#58fbd6"
        row_index: "#2aea5e"
        record: "#58fbd6"
        list: "#58fbd6"
        block: "#58fbd6"
        hints: "#384451"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#1298ff"
        shape_bool: "#98d028"
        shape_int: "#1298ff"
        shape_float: "#1298ff"
        shape_range: "#8ed4fd"
        shape_internalcall: "#98d028"
        shape_external: "#5d7e19"
        shape_externalarg: "#2aea5e"
        shape_literal: "#449a86"
        shape_operator: "#5e8baa"
        shape_signature: "#2aea5e"
        shape_string: "#00a941"
        shape_string_interpolation: "#98d028"
        shape_datetime: "#98d028"
        shape_list: "#98d028"
        shape_table: "#61d5ba"
        shape_record: "#98d028"
        shape_block: "#61d5ba"
        shape_filepath: "#5d7e19"
        shape_globpattern: "#98d028"
        shape_variable: "#00599d"
        shape_flag: "#61d5ba"
        shape_custom: "#00a941"
        shape_nothing: "#98d028"
    }
}
