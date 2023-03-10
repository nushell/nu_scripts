export def main [] {
    # extra desired values for the tempus_summer theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#202c3d"
    # foreground: "#a0abae"
    # cursor: "#a0abae"

    {
        # color for nushell primitives
        separator: "#a0abae"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#57ad47"
        empty: "#609fda"
        bool: "#a0abae"
        int: "#a0abae"
        filesize: "#a0abae"
        duration: "#a0abae"
        date: "#a0abae"
        range: "#a0abae"
        float: "#a0abae"
        string: "#a0abae"
        nothing: "#a0abae"
        binary: "#a0abae"
        cellpath: "#a0abae"
        row_index: "#57ad47"
        record: "#a0abae"
        list: "#a0abae"
        block: "#a0abae"
        hints: "#352f49"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c97ed7"
        shape_bool: "#2aa9b6"
        shape_int: "#c97ed7"
        shape_float: "#c97ed7"
        shape_range: "#bd951a"
        shape_internalcall: "#2aa9b6"
        shape_external: "#3dab95"
        shape_externalarg: "#57ad47"
        shape_literal: "#609fda"
        shape_operator: "#af9a0a"
        shape_signature: "#57ad47"
        shape_string: "#4eac6d"
        shape_string_interpolation: "#2aa9b6"
        shape_datetime: "#2aa9b6"
        shape_list: "#2aa9b6"
        shape_table: "#8196e8"
        shape_record: "#2aa9b6"
        shape_block: "#8196e8"
        shape_filepath: "#3dab95"
        shape_globpattern: "#2aa9b6"
        shape_variable: "#cc84ad"
        shape_flag: "#8196e8"
        shape_custom: "#4eac6d"
        shape_nothing: "#2aa9b6"
    }
}
