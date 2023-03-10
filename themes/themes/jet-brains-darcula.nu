export def main [] {
    # extra desired values for the jet_brains-darcula theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#202020"
    # foreground: "#adadad"
    # cursor: "#ffffff"

    {
        # color for nushell primitives
        separator: "#eeeeee"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#67ff4f"
        empty: "#4581eb"
        bool: "#eeeeee"
        int: "#eeeeee"
        filesize: "#eeeeee"
        duration: "#eeeeee"
        date: "#eeeeee"
        range: "#eeeeee"
        float: "#eeeeee"
        string: "#eeeeee"
        nothing: "#eeeeee"
        binary: "#eeeeee"
        cellpath: "#eeeeee"
        row_index: "#67ff4f"
        record: "#eeeeee"
        list: "#eeeeee"
        block: "#eeeeee"
        hints: "#545454"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#fb82ff"
        shape_bool: "#60d3d1"
        shape_int: "#fb82ff"
        shape_float: "#fb82ff"
        shape_range: "#ffff00"
        shape_internalcall: "#60d3d1"
        shape_external: "#33c2c1"
        shape_externalarg: "#67ff4f"
        shape_literal: "#4581eb"
        shape_operator: "#c2c300"
        shape_signature: "#67ff4f"
        shape_string: "#126e00"
        shape_string_interpolation: "#60d3d1"
        shape_datetime: "#60d3d1"
        shape_list: "#60d3d1"
        shape_table: "#6d9df1"
        shape_record: "#60d3d1"
        shape_block: "#6d9df1"
        shape_filepath: "#33c2c1"
        shape_globpattern: "#60d3d1"
        shape_variable: "#fa54ff"
        shape_flag: "#6d9df1"
        shape_custom: "#126e00"
        shape_nothing: "#60d3d1"
    }
}
