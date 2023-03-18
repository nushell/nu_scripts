export def main [] {
    # extra desired values for the duotone_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1f1c27"
    # foreground: "#b6a0ff"
    # cursor: "#ff9738"

    {
        # color for nushell primitives
        separator: "#e9e4ff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#2dcc72"
        empty: "#ffc183"
        bool: "#e9e4ff"
        int: "#e9e4ff"
        filesize: "#e9e4ff"
        duration: "#e9e4ff"
        date: "#e9e4ff"
        range: "#e9e4ff"
        float: "#e9e4ff"
        string: "#e9e4ff"
        nothing: "#e9e4ff"
        binary: "#e9e4ff"
        cellpath: "#e9e4ff"
        row_index: "#2dcc72"
        record: "#e9e4ff"
        list: "#e9e4ff"
        block: "#e9e4ff"
        hints: "#353146"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#dd8d40"
        shape_bool: "#2388ff"
        shape_int: "#dd8d40"
        shape_float: "#dd8d40"
        shape_range: "#d8b76e"
        shape_internalcall: "#2388ff"
        shape_external: "#2388ff"
        shape_externalarg: "#2dcc72"
        shape_literal: "#ffc183"
        shape_operator: "#d8b76e"
        shape_signature: "#2dcc72"
        shape_string: "#2dcc72"
        shape_string_interpolation: "#2388ff"
        shape_datetime: "#2388ff"
        shape_list: "#2388ff"
        shape_table: "#ffc183"
        shape_record: "#2388ff"
        shape_block: "#ffc183"
        shape_filepath: "#2388ff"
        shape_globpattern: "#2388ff"
        shape_variable: "#dd8d40"
        shape_flag: "#ffc183"
        shape_custom: "#2dcc72"
        shape_nothing: "#2388ff"
    }
}
