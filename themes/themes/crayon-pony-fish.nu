export def main [] {
    # extra desired values for the crayon_pony-fish theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#150707"
    # foreground: "#68525a"
    # cursor: "#68525a"

    {
        # color for nushell primitives
        separator: "#b0949d"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8dff57"
        empty: "#8c87b0"
        bool: "#b0949d"
        int: "#b0949d"
        filesize: "#b0949d"
        duration: "#b0949d"
        date: "#b0949d"
        range: "#b0949d"
        float: "#b0949d"
        string: "#b0949d"
        nothing: "#b0949d"
        binary: "#b0949d"
        cellpath: "#b0949d"
        row_index: "#8dff57"
        record: "#b0949d"
        list: "#b0949d"
        block: "#b0949d"
        hints: "#3d2b2e"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#fc6cba"
        shape_bool: "#ffceaf"
        shape_int: "#fc6cba"
        shape_float: "#fc6cba"
        shape_range: "#c8381d"
        shape_internalcall: "#ffceaf"
        shape_external: "#e8a866"
        shape_externalarg: "#8dff57"
        shape_literal: "#8c87b0"
        shape_operator: "#ab311b"
        shape_signature: "#8dff57"
        shape_string: "#579524"
        shape_string_interpolation: "#ffceaf"
        shape_datetime: "#ffceaf"
        shape_list: "#ffceaf"
        shape_table: "#cfc9ff"
        shape_record: "#ffceaf"
        shape_block: "#cfc9ff"
        shape_filepath: "#e8a866"
        shape_globpattern: "#ffceaf"
        shape_variable: "#692f50"
        shape_flag: "#cfc9ff"
        shape_custom: "#579524"
        shape_nothing: "#ffceaf"
    }
}
