export def main [] {
    # extra desired values for the nord_alt theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2e3440"
    # foreground: "#8fbcbb"
    # cursor: "#8fbcbb"

    {
        # color for nushell primitives
        separator: "#5e81ac"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#ebcb8b"
        empty: "#d8dee9"
        bool: "#5e81ac"
        int: "#5e81ac"
        filesize: "#5e81ac"
        duration: "#5e81ac"
        date: "#5e81ac"
        range: "#5e81ac"
        float: "#5e81ac"
        string: "#5e81ac"
        nothing: "#5e81ac"
        binary: "#5e81ac"
        cellpath: "#5e81ac"
        row_index: "#ebcb8b"
        record: "#5e81ac"
        list: "#5e81ac"
        block: "#5e81ac"
        hints: "#bf616a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#81a1c1"
        shape_bool: "#b48ead"
        shape_int: "#81a1c1"
        shape_float: "#81a1c1"
        shape_range: "#a3be8c"
        shape_internalcall: "#b48ead"
        shape_external: "#eceff4"
        shape_externalarg: "#ebcb8b"
        shape_literal: "#d8dee9"
        shape_operator: "#4c566a"
        shape_signature: "#ebcb8b"
        shape_string: "#434c5e"
        shape_string_interpolation: "#b48ead"
        shape_datetime: "#b48ead"
        shape_list: "#b48ead"
        shape_table: "#88c0d0"
        shape_record: "#b48ead"
        shape_block: "#88c0d0"
        shape_filepath: "#eceff4"
        shape_globpattern: "#b48ead"
        shape_variable: "#e5e9f0"
        shape_flag: "#88c0d0"
        shape_custom: "#434c5e"
        shape_nothing: "#b48ead"
    }
}
