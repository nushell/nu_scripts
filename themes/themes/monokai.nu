export def main [] {
    # extra desired values for the monokai theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#272822"
    # foreground: "#f8f8f2"
    # cursor: "#f8f8f2"

    {
        # color for nushell primitives
        separator: "#f9f8f5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a6e22e"
        empty: "#66d9ef"
        bool: "#f9f8f5"
        int: "#f9f8f5"
        filesize: "#f9f8f5"
        duration: "#f9f8f5"
        date: "#f9f8f5"
        range: "#f9f8f5"
        float: "#f9f8f5"
        string: "#f9f8f5"
        nothing: "#f9f8f5"
        binary: "#f9f8f5"
        cellpath: "#f9f8f5"
        row_index: "#a6e22e"
        record: "#f9f8f5"
        list: "#f9f8f5"
        block: "#f9f8f5"
        hints: "#75715e"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ae81ff"
        shape_bool: "#a1efe4"
        shape_int: "#ae81ff"
        shape_float: "#ae81ff"
        shape_range: "#f4bf75"
        shape_internalcall: "#a1efe4"
        shape_external: "#a1efe4"
        shape_externalarg: "#a6e22e"
        shape_literal: "#66d9ef"
        shape_operator: "#f4bf75"
        shape_signature: "#a6e22e"
        shape_string: "#a6e22e"
        shape_string_interpolation: "#a1efe4"
        shape_datetime: "#a1efe4"
        shape_list: "#a1efe4"
        shape_table: "#66d9ef"
        shape_record: "#a1efe4"
        shape_block: "#66d9ef"
        shape_filepath: "#a1efe4"
        shape_globpattern: "#a1efe4"
        shape_variable: "#ae81ff"
        shape_flag: "#66d9ef"
        shape_custom: "#a6e22e"
        shape_nothing: "#a1efe4"
    }
}
