export def main [] {
    # extra desired values for the fideloper theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#282f32"
    # foreground: "#dad9df"
    # cursor: "#d35f5a"

    {
        # color for nushell primitives
        separator: "#fcf4de"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#d35f5a"
        empty: "#2e78c1"
        bool: "#fcf4de"
        int: "#fcf4de"
        filesize: "#fcf4de"
        duration: "#fcf4de"
        date: "#fcf4de"
        range: "#fcf4de"
        float: "#fcf4de"
        string: "#fcf4de"
        nothing: "#fcf4de"
        binary: "#fcf4de"
        cellpath: "#fcf4de"
        row_index: "#d35f5a"
        record: "#fcf4de"
        list: "#fcf4de"
        block: "#fcf4de"
        hints: "#092027"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#5b5db2"
        shape_bool: "#81908f"
        shape_int: "#5b5db2"
        shape_float: "#5b5db2"
        shape_range: "#a86571"
        shape_internalcall: "#81908f"
        shape_external: "#309185"
        shape_externalarg: "#d35f5a"
        shape_literal: "#2e78c1"
        shape_operator: "#b7aa9a"
        shape_signature: "#d35f5a"
        shape_string: "#edb7ab"
        shape_string_interpolation: "#81908f"
        shape_datetime: "#81908f"
        shape_list: "#81908f"
        shape_table: "#7c84c4"
        shape_record: "#81908f"
        shape_block: "#7c84c4"
        shape_filepath: "#309185"
        shape_globpattern: "#81908f"
        shape_variable: "#c0226e"
        shape_flag: "#7c84c4"
        shape_custom: "#edb7ab"
        shape_nothing: "#81908f"
    }
}
