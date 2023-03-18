export def main [] {
    # extra desired values for the gruvbox_material-light-hard theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f9f5d7"
    # foreground: "#654735"
    # cursor: "#654735"

    {
        # color for nushell primitives
        separator: "#654735"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#6c782e"
        empty: "#45707a"
        bool: "#654735"
        int: "#654735"
        filesize: "#654735"
        duration: "#654735"
        date: "#654735"
        range: "#654735"
        float: "#654735"
        string: "#654735"
        nothing: "#654735"
        binary: "#654735"
        cellpath: "#654735"
        row_index: "#6c782e"
        record: "#654735"
        list: "#654735"
        block: "#654735"
        hints: "#f9f5d7"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#945e80"
        shape_bool: "#4c7a5d"
        shape_int: "#945e80"
        shape_float: "#945e80"
        shape_range: "#b47109"
        shape_internalcall: "#4c7a5d"
        shape_external: "#4c7a5d"
        shape_externalarg: "#6c782e"
        shape_literal: "#45707a"
        shape_operator: "#b47109"
        shape_signature: "#6c782e"
        shape_string: "#6c782e"
        shape_string_interpolation: "#4c7a5d"
        shape_datetime: "#4c7a5d"
        shape_list: "#4c7a5d"
        shape_table: "#45707a"
        shape_record: "#4c7a5d"
        shape_block: "#45707a"
        shape_filepath: "#4c7a5d"
        shape_globpattern: "#4c7a5d"
        shape_variable: "#945e80"
        shape_flag: "#45707a"
        shape_custom: "#6c782e"
        shape_nothing: "#4c7a5d"
    }
}
