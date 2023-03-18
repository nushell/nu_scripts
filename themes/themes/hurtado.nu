export def main [] {
    # extra desired values for the hurtado theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#dbdbdb"
    # cursor: "#dbdbdb"

    {
        # color for nushell primitives
        separator: "#dbdbdb"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a5df55"
        empty: "#496487"
        bool: "#dbdbdb"
        int: "#dbdbdb"
        filesize: "#dbdbdb"
        duration: "#dbdbdb"
        date: "#dbdbdb"
        range: "#dbdbdb"
        float: "#dbdbdb"
        string: "#dbdbdb"
        nothing: "#dbdbdb"
        binary: "#dbdbdb"
        cellpath: "#dbdbdb"
        row_index: "#a5df55"
        record: "#dbdbdb"
        list: "#dbdbdb"
        block: "#dbdbdb"
        hints: "#262626"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c001c1"
        shape_bool: "#86eafe"
        shape_int: "#c001c1"
        shape_float: "#c001c1"
        shape_range: "#fbe84a"
        shape_internalcall: "#86eafe"
        shape_external: "#86e9fe"
        shape_externalarg: "#a5df55"
        shape_literal: "#496487"
        shape_operator: "#fbe74a"
        shape_signature: "#a5df55"
        shape_string: "#a5e055"
        shape_string_interpolation: "#86eafe"
        shape_datetime: "#86eafe"
        shape_list: "#86eafe"
        shape_table: "#89beff"
        shape_record: "#86eafe"
        shape_block: "#89beff"
        shape_filepath: "#86e9fe"
        shape_globpattern: "#86eafe"
        shape_variable: "#fd5ff1"
        shape_flag: "#89beff"
        shape_custom: "#a5e055"
        shape_nothing: "#86eafe"
    }
}
