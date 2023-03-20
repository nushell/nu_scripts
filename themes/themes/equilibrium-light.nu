export def main [] {
    # extra desired values for the equilibrium_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f5f0e7"
    # foreground: "#43474e"
    # cursor: "#43474e"

    {
        # color for nushell primitives
        separator: "#181c22"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#637200"
        empty: "#0073b5"
        bool: "#181c22"
        int: "#181c22"
        filesize: "#181c22"
        duration: "#181c22"
        date: "#181c22"
        range: "#181c22"
        float: "#181c22"
        string: "#181c22"
        nothing: "#181c22"
        binary: "#181c22"
        cellpath: "#181c22"
        row_index: "#637200"
        record: "#181c22"
        list: "#181c22"
        block: "#181c22"
        hints: "#73777f"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#4e66b6"
        shape_bool: "#007a72"
        shape_int: "#4e66b6"
        shape_float: "#4e66b6"
        shape_range: "#9d6f00"
        shape_internalcall: "#007a72"
        shape_external: "#007a72"
        shape_externalarg: "#637200"
        shape_literal: "#0073b5"
        shape_operator: "#9d6f00"
        shape_signature: "#637200"
        shape_string: "#637200"
        shape_string_interpolation: "#007a72"
        shape_datetime: "#007a72"
        shape_list: "#007a72"
        shape_table: "#0073b5"
        shape_record: "#007a72"
        shape_block: "#0073b5"
        shape_filepath: "#007a72"
        shape_globpattern: "#007a72"
        shape_variable: "#4e66b6"
        shape_flag: "#0073b5"
        shape_custom: "#637200"
        shape_nothing: "#007a72"
    }
}
