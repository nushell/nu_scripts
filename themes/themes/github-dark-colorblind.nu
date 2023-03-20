export def main [] {
    # extra desired values for the {{theme}} theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0d1117"
    # foreground: "#b3b1ad"
    # cursor: "#73b7f2"

    {
        # color for nushell primitives
        separator: "#f0f6fc"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#56d364"
        empty: "#58a6ff"
        bool: "#f0f6fc"
        int: "#f0f6fc"
        filesize: "#f0f6fc"
        duration: "#f0f6fc"
        date: "#f0f6fc"
        range: "#f0f6fc"
        float: "#f0f6fc"
        string: "#f0f6fc"
        nothing: "#f0f6fc"
        binary: "#f0f6fc"
        cellpath: "#f0f6fc"
        row_index: "#56d364"
        record: "#f0f6fc"
        list: "#f0f6fc"
        block: "#f0f6fc"
        hints: "#6e7681"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d2a8ff"
        shape_bool: "#56d4dd"
        shape_int: "#d2a8ff"
        shape_float: "#d2a8ff"
        shape_range: "#e3b341"
        shape_internalcall: "#56d4dd"
        shape_external: "#39c5cf"
        shape_externalarg: "#56d364"
        shape_literal: "#58a6ff"
        shape_operator: "#d29922"
        shape_signature: "#56d364"
        shape_string: "#3fb950"
        shape_string_interpolation: "#56d4dd"
        shape_datetime: "#56d4dd"
        shape_list: "#56d4dd"
        shape_table: "#79c0ff"
        shape_record: "#56d4dd"
        shape_block: "#79c0ff"
        shape_filepath: "#39c5cf"
        shape_globpattern: "#56d4dd"
        shape_variable: "#bc8cff"
        shape_flag: "#79c0ff"
        shape_custom: "#3fb950"
        shape_nothing: "#56d4dd"
    }
}
