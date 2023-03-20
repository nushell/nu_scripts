export def main [] {
    # extra desired values for the vag theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#191f1d"
    # foreground: "#d9e6f2"
    # cursor: "#d9e6f2"

    {
        # color for nushell primitives
        separator: "#cfcfcf"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#3bb076"
        empty: "#7139a8"
        bool: "#cfcfcf"
        int: "#cfcfcf"
        filesize: "#cfcfcf"
        duration: "#cfcfcf"
        date: "#cfcfcf"
        range: "#cfcfcf"
        float: "#cfcfcf"
        string: "#cfcfcf"
        nothing: "#cfcfcf"
        binary: "#cfcfcf"
        cellpath: "#cfcfcf"
        row_index: "#3bb076"
        record: "#cfcfcf"
        list: "#cfcfcf"
        block: "#cfcfcf"
        hints: "#494949"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b03b76"
        shape_bool: "#3b76b0"
        shape_int: "#b03b76"
        shape_float: "#b03b76"
        shape_range: "#76b03b"
        shape_internalcall: "#3b76b0"
        shape_external: "#3971a8"
        shape_externalarg: "#3bb076"
        shape_literal: "#7139a8"
        shape_operator: "#71a839"
        shape_signature: "#3bb076"
        shape_string: "#39a871"
        shape_string_interpolation: "#3b76b0"
        shape_datetime: "#3b76b0"
        shape_list: "#3b76b0"
        shape_table: "#763bb0"
        shape_record: "#3b76b0"
        shape_block: "#763bb0"
        shape_filepath: "#3971a8"
        shape_globpattern: "#3b76b0"
        shape_variable: "#a83971"
        shape_flag: "#763bb0"
        shape_custom: "#39a871"
        shape_nothing: "#3b76b0"
    }
}
