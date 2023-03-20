export def main [] {
    # extra desired values for the tempus_night theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1a1a1a"
    # foreground: "#e0e0e0"
    # cursor: "#e0e0e0"

    {
        # color for nushell primitives
        separator: "#e0e0e0"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#88c400"
        empty: "#5aaaf2"
        bool: "#e0e0e0"
        int: "#e0e0e0"
        filesize: "#e0e0e0"
        duration: "#e0e0e0"
        date: "#e0e0e0"
        range: "#e0e0e0"
        float: "#e0e0e0"
        string: "#e0e0e0"
        nothing: "#e0e0e0"
        binary: "#e0e0e0"
        cellpath: "#e0e0e0"
        row_index: "#88c400"
        record: "#e0e0e0"
        list: "#e0e0e0"
        block: "#e0e0e0"
        hints: "#18143d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#de99f0"
        shape_bool: "#00ca9a"
        shape_int: "#de99f0"
        shape_float: "#de99f0"
        shape_range: "#d7ae00"
        shape_internalcall: "#00ca9a"
        shape_external: "#1db5c3"
        shape_externalarg: "#88c400"
        shape_literal: "#5aaaf2"
        shape_operator: "#b0a800"
        shape_signature: "#88c400"
        shape_string: "#52ba40"
        shape_string_interpolation: "#00ca9a"
        shape_datetime: "#00ca9a"
        shape_list: "#00ca9a"
        shape_table: "#8cb4f0"
        shape_record: "#00ca9a"
        shape_block: "#8cb4f0"
        shape_filepath: "#1db5c3"
        shape_globpattern: "#00ca9a"
        shape_variable: "#ee80c0"
        shape_flag: "#8cb4f0"
        shape_custom: "#52ba40"
        shape_nothing: "#00ca9a"
    }
}
