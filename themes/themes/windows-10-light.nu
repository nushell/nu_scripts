export def main [] {
    # extra desired values for the windows_10-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f2f2f2"
    # foreground: "#767676"
    # cursor: "#767676"

    {
        # color for nushell primitives
        separator: "#0c0c0c"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#13a10e"
        empty: "#0037da"
        bool: "#0c0c0c"
        int: "#0c0c0c"
        filesize: "#0c0c0c"
        duration: "#0c0c0c"
        date: "#0c0c0c"
        range: "#0c0c0c"
        float: "#0c0c0c"
        string: "#0c0c0c"
        nothing: "#0c0c0c"
        binary: "#0c0c0c"
        cellpath: "#0c0c0c"
        row_index: "#13a10e"
        record: "#0c0c0c"
        list: "#0c0c0c"
        block: "#0c0c0c"
        hints: "#cccccc"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#881798"
        shape_bool: "#3a96dd"
        shape_int: "#881798"
        shape_float: "#881798"
        shape_range: "#c19c00"
        shape_internalcall: "#3a96dd"
        shape_external: "#3a96dd"
        shape_externalarg: "#13a10e"
        shape_literal: "#0037da"
        shape_operator: "#c19c00"
        shape_signature: "#13a10e"
        shape_string: "#13a10e"
        shape_string_interpolation: "#3a96dd"
        shape_datetime: "#3a96dd"
        shape_list: "#3a96dd"
        shape_table: "#0037da"
        shape_record: "#3a96dd"
        shape_block: "#0037da"
        shape_filepath: "#3a96dd"
        shape_globpattern: "#3a96dd"
        shape_variable: "#881798"
        shape_flag: "#0037da"
        shape_custom: "#13a10e"
        shape_nothing: "#3a96dd"
    }
}
