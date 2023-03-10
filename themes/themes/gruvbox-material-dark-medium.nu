export def main [] {
    # extra desired values for the gruvbox_material-dark-medium theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#282828"
    # foreground: "#d4be98"
    # cursor: "#d4be98"

    {
        # color for nushell primitives
        separator: "#d4be98"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a9b665"
        empty: "#7daea3"
        bool: "#d4be98"
        int: "#d4be98"
        filesize: "#d4be98"
        duration: "#d4be98"
        date: "#d4be98"
        range: "#d4be98"
        float: "#d4be98"
        string: "#d4be98"
        nothing: "#d4be98"
        binary: "#d4be98"
        cellpath: "#d4be98"
        row_index: "#a9b665"
        record: "#d4be98"
        list: "#d4be98"
        block: "#d4be98"
        hints: "#282828"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d3869b"
        shape_bool: "#89b482"
        shape_int: "#d3869b"
        shape_float: "#d3869b"
        shape_range: "#d8a657"
        shape_internalcall: "#89b482"
        shape_external: "#89b482"
        shape_externalarg: "#a9b665"
        shape_literal: "#7daea3"
        shape_operator: "#d8a657"
        shape_signature: "#a9b665"
        shape_string: "#a9b665"
        shape_string_interpolation: "#89b482"
        shape_datetime: "#89b482"
        shape_list: "#89b482"
        shape_table: "#7daea3"
        shape_record: "#89b482"
        shape_block: "#7daea3"
        shape_filepath: "#89b482"
        shape_globpattern: "#89b482"
        shape_variable: "#d3869b"
        shape_flag: "#7daea3"
        shape_custom: "#a9b665"
        shape_nothing: "#89b482"
    }
}
