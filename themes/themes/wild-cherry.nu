export def main [] {
    # extra desired values for the wild_cherry theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1f1726"
    # foreground: "#dafaff"
    # cursor: "#dafaff"

    {
        # color for nushell primitives
        separator: "#e4838d"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#f4dca5"
        empty: "#883cdc"
        bool: "#e4838d"
        int: "#e4838d"
        filesize: "#e4838d"
        duration: "#e4838d"
        date: "#e4838d"
        range: "#e4838d"
        float: "#e4838d"
        string: "#e4838d"
        nothing: "#e4838d"
        binary: "#e4838d"
        cellpath: "#e4838d"
        row_index: "#f4dca5"
        record: "#e4838d"
        list: "#e4838d"
        block: "#e4838d"
        hints: "#009cc9"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ae636b"
        shape_bool: "#ff919d"
        shape_int: "#ae636b"
        shape_float: "#ae636b"
        shape_range: "#eac066"
        shape_internalcall: "#ff919d"
        shape_external: "#c1b8b7"
        shape_externalarg: "#f4dca5"
        shape_literal: "#883cdc"
        shape_operator: "#ffd16f"
        shape_signature: "#f4dca5"
        shape_string: "#2ab250"
        shape_string_interpolation: "#ff919d"
        shape_datetime: "#ff919d"
        shape_list: "#ff919d"
        shape_table: "#308cba"
        shape_record: "#ff919d"
        shape_block: "#308cba"
        shape_filepath: "#c1b8b7"
        shape_globpattern: "#ff919d"
        shape_variable: "#ececec"
        shape_flag: "#308cba"
        shape_custom: "#2ab250"
        shape_nothing: "#ff919d"
    }
}
