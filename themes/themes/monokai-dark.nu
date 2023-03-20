export def main [] {
    # extra desired values for the monokai_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#272822"
    # foreground: "#f8f8f2"
    # cursor: "#f8f8f2"

    {
        # color for nushell primitives
        separator: "#f8f8f2"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a6e22e"
        empty: "#66d9ef"
        bool: "#f8f8f2"
        int: "#f8f8f2"
        filesize: "#f8f8f2"
        duration: "#f8f8f2"
        date: "#f8f8f2"
        range: "#f8f8f2"
        float: "#f8f8f2"
        string: "#f8f8f2"
        nothing: "#f8f8f2"
        binary: "#f8f8f2"
        cellpath: "#f8f8f2"
        row_index: "#a6e22e"
        record: "#f8f8f2"
        list: "#f8f8f2"
        block: "#f8f8f2"
        hints: "#272822"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ae81ff"
        shape_bool: "#2aa198"
        shape_int: "#ae81ff"
        shape_float: "#ae81ff"
        shape_range: "#f4bf75"
        shape_internalcall: "#2aa198"
        shape_external: "#2aa198"
        shape_externalarg: "#a6e22e"
        shape_literal: "#66d9ef"
        shape_operator: "#f4bf75"
        shape_signature: "#a6e22e"
        shape_string: "#a6e22e"
        shape_string_interpolation: "#2aa198"
        shape_datetime: "#2aa198"
        shape_list: "#2aa198"
        shape_table: "#66d9ef"
        shape_record: "#2aa198"
        shape_block: "#66d9ef"
        shape_filepath: "#2aa198"
        shape_globpattern: "#2aa198"
        shape_variable: "#ae81ff"
        shape_flag: "#66d9ef"
        shape_custom: "#a6e22e"
        shape_nothing: "#2aa198"
    }
}
