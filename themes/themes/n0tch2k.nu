export def main [] {
    # extra desired values for the n0tch2k theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#222222"
    # foreground: "#a0a0a0"
    # cursor: "#a0a0a0"

    {
        # color for nushell primitives
        separator: "#d8c8bb"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8c8c8c"
        empty: "#657d3e"
        bool: "#d8c8bb"
        int: "#d8c8bb"
        filesize: "#d8c8bb"
        duration: "#d8c8bb"
        date: "#d8c8bb"
        range: "#d8c8bb"
        float: "#d8c8bb"
        string: "#d8c8bb"
        nothing: "#d8c8bb"
        binary: "#d8c8bb"
        cellpath: "#d8c8bb"
        row_index: "#8c8c8c"
        record: "#d8c8bb"
        list: "#d8c8bb"
        block: "#d8c8bb"
        hints: "#474747"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a3a3a3"
        shape_bool: "#dcdcdc"
        shape_int: "#a3a3a3"
        shape_float: "#a3a3a3"
        shape_range: "#a99175"
        shape_internalcall: "#dcdcdc"
        shape_external: "#c9c9c9"
        shape_externalarg: "#8c8c8c"
        shape_literal: "#657d3e"
        shape_operator: "#a98051"
        shape_signature: "#8c8c8c"
        shape_string: "#666666"
        shape_string_interpolation: "#dcdcdc"
        shape_datetime: "#dcdcdc"
        shape_list: "#dcdcdc"
        shape_table: "#98bd5e"
        shape_record: "#dcdcdc"
        shape_block: "#98bd5e"
        shape_filepath: "#c9c9c9"
        shape_globpattern: "#dcdcdc"
        shape_variable: "#767676"
        shape_flag: "#98bd5e"
        shape_custom: "#666666"
        shape_nothing: "#dcdcdc"
    }
}
