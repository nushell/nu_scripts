export def main [] {
    # extra desired values for the square theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0a1e24"
    # foreground: "#1a1a1a"
    # cursor: "#1a1a1a"

    {
        # color for nushell primitives
        separator: "#e2e2e2"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#c3f786"
        empty: "#a9cdeb"
        bool: "#e2e2e2"
        int: "#e2e2e2"
        filesize: "#e2e2e2"
        duration: "#e2e2e2"
        date: "#e2e2e2"
        range: "#e2e2e2"
        float: "#e2e2e2"
        string: "#e2e2e2"
        nothing: "#e2e2e2"
        binary: "#e2e2e2"
        cellpath: "#e2e2e2"
        row_index: "#c3f786"
        record: "#e2e2e2"
        list: "#e2e2e2"
        block: "#e2e2e2"
        hints: "#141414"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ad7fa8"
        shape_bool: "#d7d9fc"
        shape_int: "#ad7fa8"
        shape_float: "#ad7fa8"
        shape_range: "#fcfbcc"
        shape_internalcall: "#d7d9fc"
        shape_external: "#c9caec"
        shape_externalarg: "#c3f786"
        shape_literal: "#a9cdeb"
        shape_operator: "#ecebbe"
        shape_signature: "#c3f786"
        shape_string: "#b6377d"
        shape_string_interpolation: "#d7d9fc"
        shape_datetime: "#d7d9fc"
        shape_list: "#d7d9fc"
        shape_table: "#b6defb"
        shape_record: "#d7d9fc"
        shape_block: "#b6defb"
        shape_filepath: "#c9caec"
        shape_globpattern: "#d7d9fc"
        shape_variable: "#75507b"
        shape_flag: "#b6defb"
        shape_custom: "#b6377d"
        shape_nothing: "#d7d9fc"
    }
}
