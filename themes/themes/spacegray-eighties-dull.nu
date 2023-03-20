export def main [] {
    # extra desired values for the spacegray_eighties-dull theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#222222"
    # foreground: "#c9c6bc"
    # cursor: "#c9c6bc"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#89e986"
        empty: "#7c8fa5"
        bool: "#ffffff"
        int: "#ffffff"
        filesize: "#ffffff"
        duration: "#ffffff"
        date: "#ffffff"
        range: "#ffffff"
        float: "#ffffff"
        string: "#ffffff"
        nothing: "#ffffff"
        binary: "#ffffff"
        cellpath: "#ffffff"
        row_index: "#89e986"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#555555"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#bf83c1"
        shape_bool: "#58c2c1"
        shape_int: "#bf83c1"
        shape_float: "#bf83c1"
        shape_range: "#fec254"
        shape_internalcall: "#58c2c1"
        shape_external: "#80cdcb"
        shape_externalarg: "#89e986"
        shape_literal: "#7c8fa5"
        shape_operator: "#c6735a"
        shape_signature: "#89e986"
        shape_string: "#92b477"
        shape_string_interpolation: "#58c2c1"
        shape_datetime: "#58c2c1"
        shape_list: "#58c2c1"
        shape_table: "#5486c0"
        shape_record: "#58c2c1"
        shape_block: "#5486c0"
        shape_filepath: "#80cdcb"
        shape_globpattern: "#58c2c1"
        shape_variable: "#a5789e"
        shape_flag: "#5486c0"
        shape_custom: "#92b477"
        shape_nothing: "#58c2c1"
    }
}
