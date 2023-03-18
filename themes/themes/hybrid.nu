export def main [] {
    # extra desired values for the hybrid theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#141414"
    # foreground: "#94a3a5"
    # cursor: "#94a3a5"

    {
        # color for nushell primitives
        separator: "#c5c8c6"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b5bd68"
        empty: "#5f819d"
        bool: "#c5c8c6"
        int: "#c5c8c6"
        filesize: "#c5c8c6"
        duration: "#c5c8c6"
        date: "#c5c8c6"
        range: "#c5c8c6"
        float: "#c5c8c6"
        string: "#c5c8c6"
        nothing: "#c5c8c6"
        binary: "#c5c8c6"
        cellpath: "#c5c8c6"
        row_index: "#b5bd68"
        record: "#c5c8c6"
        list: "#c5c8c6"
        block: "#c5c8c6"
        hints: "#373b41"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b294bb"
        shape_bool: "#8abeb7"
        shape_int: "#b294bb"
        shape_float: "#b294bb"
        shape_range: "#f0c674"
        shape_internalcall: "#8abeb7"
        shape_external: "#5e8d87"
        shape_externalarg: "#b5bd68"
        shape_literal: "#5f819d"
        shape_operator: "#de935f"
        shape_signature: "#b5bd68"
        shape_string: "#8c9440"
        shape_string_interpolation: "#8abeb7"
        shape_datetime: "#8abeb7"
        shape_list: "#8abeb7"
        shape_table: "#81a2be"
        shape_record: "#8abeb7"
        shape_block: "#81a2be"
        shape_filepath: "#5e8d87"
        shape_globpattern: "#8abeb7"
        shape_variable: "#85678f"
        shape_flag: "#81a2be"
        shape_custom: "#8c9440"
        shape_nothing: "#8abeb7"
    }
}
