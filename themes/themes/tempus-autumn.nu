export def main [] {
    # extra desired values for the tempus_autumn theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#302420"
    # foreground: "#a9a2a6"
    # cursor: "#a9a2a6"

    {
        # color for nushell primitives
        separator: "#a9a2a6"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#43a770"
        empty: "#7897c2"
        bool: "#a9a2a6"
        int: "#a9a2a6"
        filesize: "#a9a2a6"
        duration: "#a9a2a6"
        date: "#a9a2a6"
        range: "#a9a2a6"
        float: "#a9a2a6"
        string: "#a9a2a6"
        nothing: "#a9a2a6"
        binary: "#a9a2a6"
        cellpath: "#a9a2a6"
        row_index: "#43a770"
        record: "#a9a2a6"
        list: "#a9a2a6"
        block: "#a9a2a6"
        hints: "#312e2a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c57bc4"
        shape_bool: "#2aa4ad"
        shape_int: "#c57bc4"
        shape_float: "#c57bc4"
        shape_range: "#ba9000"
        shape_internalcall: "#2aa4ad"
        shape_external: "#52a485"
        shape_externalarg: "#43a770"
        shape_literal: "#7897c2"
        shape_operator: "#ac9440"
        shape_signature: "#43a770"
        shape_string: "#80a100"
        shape_string_interpolation: "#2aa4ad"
        shape_datetime: "#2aa4ad"
        shape_list: "#2aa4ad"
        shape_table: "#908ed4"
        shape_record: "#2aa4ad"
        shape_block: "#908ed4"
        shape_filepath: "#52a485"
        shape_globpattern: "#2aa4ad"
        shape_variable: "#dd758e"
        shape_flag: "#908ed4"
        shape_custom: "#80a100"
        shape_nothing: "#2aa4ad"
    }
}
