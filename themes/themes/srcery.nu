export def main [] {
    # extra desired values for the srcery theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1c1b19"
    # foreground: "#fce8c3"
    # cursor: "#fbb829"

    {
        # color for nushell primitives
        separator: "#fce8c3"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#98bc37"
        empty: "#2c78bf"
        bool: "#fce8c3"
        int: "#fce8c3"
        filesize: "#fce8c3"
        duration: "#fce8c3"
        date: "#fce8c3"
        range: "#fce8c3"
        float: "#fce8c3"
        string: "#fce8c3"
        nothing: "#fce8c3"
        binary: "#fce8c3"
        cellpath: "#fce8c3"
        row_index: "#98bc37"
        record: "#fce8c3"
        list: "#fce8c3"
        block: "#fce8c3"
        hints: "#918175"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff5c8f"
        shape_bool: "#2be4d0"
        shape_int: "#ff5c8f"
        shape_float: "#ff5c8f"
        shape_range: "#fed06e"
        shape_internalcall: "#2be4d0"
        shape_external: "#0aaeb3"
        shape_externalarg: "#98bc37"
        shape_literal: "#2c78bf"
        shape_operator: "#fbb829"
        shape_signature: "#98bc37"
        shape_string: "#519f50"
        shape_string_interpolation: "#2be4d0"
        shape_datetime: "#2be4d0"
        shape_list: "#2be4d0"
        shape_table: "#68a8e4"
        shape_record: "#2be4d0"
        shape_block: "#68a8e4"
        shape_filepath: "#0aaeb3"
        shape_globpattern: "#2be4d0"
        shape_variable: "#e02c6d"
        shape_flag: "#68a8e4"
        shape_custom: "#519f50"
        shape_nothing: "#2be4d0"
    }
}
