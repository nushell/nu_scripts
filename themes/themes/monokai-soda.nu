export def main [] {
    # extra desired values for the monokai_soda theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1a1a1a"
    # foreground: "#c4c5b5"
    # cursor: "#c4c5b5"

    {
        # color for nushell primitives
        separator: "#f6f6ef"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#98e024"
        empty: "#9d65ff"
        bool: "#f6f6ef"
        int: "#f6f6ef"
        filesize: "#f6f6ef"
        duration: "#f6f6ef"
        date: "#f6f6ef"
        range: "#f6f6ef"
        float: "#f6f6ef"
        string: "#f6f6ef"
        nothing: "#f6f6ef"
        binary: "#f6f6ef"
        cellpath: "#f6f6ef"
        row_index: "#98e024"
        record: "#f6f6ef"
        list: "#f6f6ef"
        block: "#f6f6ef"
        hints: "#625e4c"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#f4005f"
        shape_bool: "#58d1eb"
        shape_int: "#f4005f"
        shape_float: "#f4005f"
        shape_range: "#e0d561"
        shape_internalcall: "#58d1eb"
        shape_external: "#58d1eb"
        shape_externalarg: "#98e024"
        shape_literal: "#9d65ff"
        shape_operator: "#fa8419"
        shape_signature: "#98e024"
        shape_string: "#98e024"
        shape_string_interpolation: "#58d1eb"
        shape_datetime: "#58d1eb"
        shape_list: "#58d1eb"
        shape_table: "#9d65ff"
        shape_record: "#58d1eb"
        shape_block: "#9d65ff"
        shape_filepath: "#58d1eb"
        shape_globpattern: "#58d1eb"
        shape_variable: "#f4005f"
        shape_flag: "#9d65ff"
        shape_custom: "#98e024"
        shape_nothing: "#58d1eb"
    }
}
