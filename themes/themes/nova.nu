export def main [] {
    # extra desired values for the nova theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#3c4c55"
    # foreground: "#c5d4dd"
    # cursor: "#c5d4dd"

    {
        # color for nushell primitives
        separator: "#556873"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7fc1ca"
        empty: "#83afe5"
        bool: "#556873"
        int: "#556873"
        filesize: "#556873"
        duration: "#556873"
        date: "#556873"
        range: "#556873"
        float: "#556873"
        string: "#556873"
        nothing: "#556873"
        binary: "#556873"
        cellpath: "#556873"
        row_index: "#7fc1ca"
        record: "#556873"
        list: "#556873"
        block: "#556873"
        hints: "#899ba6"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9a93e1"
        shape_bool: "#f2c38f"
        shape_int: "#9a93e1"
        shape_float: "#9a93e1"
        shape_range: "#a8ce93"
        shape_internalcall: "#f2c38f"
        shape_external: "#f2c38f"
        shape_externalarg: "#7fc1ca"
        shape_literal: "#83afe5"
        shape_operator: "#a8ce93"
        shape_signature: "#7fc1ca"
        shape_string: "#7fc1ca"
        shape_string_interpolation: "#f2c38f"
        shape_datetime: "#f2c38f"
        shape_list: "#f2c38f"
        shape_table: "#83afe5"
        shape_record: "#f2c38f"
        shape_block: "#83afe5"
        shape_filepath: "#f2c38f"
        shape_globpattern: "#f2c38f"
        shape_variable: "#9a93e1"
        shape_flag: "#83afe5"
        shape_custom: "#7fc1ca"
        shape_nothing: "#f2c38f"
    }
}
