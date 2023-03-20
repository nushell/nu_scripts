export def main [] {
    # extra desired values for the foxnightly theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2a2a2e"
    # foreground: "#d7d7db"
    # cursor: "#d7d7db"

    {
        # color for nushell primitives
        separator: "#5c3566"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#66a05b"
        empty: "#66a05b"
        bool: "#5c3566"
        int: "#5c3566"
        filesize: "#5c3566"
        duration: "#5c3566"
        date: "#5c3566"
        range: "#5c3566"
        float: "#5c3566"
        string: "#5c3566"
        nothing: "#5c3566"
        binary: "#5c3566"
        cellpath: "#5c3566"
        row_index: "#66a05b"
        record: "#5c3566"
        list: "#5c3566"
        block: "#5c3566"
        hints: "#a40000"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8f5902"
        shape_bool: "#c4a000"
        shape_int: "#8f5902"
        shape_float: "#8f5902"
        shape_range: "#ffb86c"
        shape_internalcall: "#c4a000"
        shape_external: "#acacae"
        shape_externalarg: "#66a05b"
        shape_literal: "#66a05b"
        shape_operator: "#729fcf"
        shape_signature: "#66a05b"
        shape_string: "#ff7de9"
        shape_string_interpolation: "#c4a000"
        shape_datetime: "#c4a000"
        shape_list: "#c4a000"
        shape_table: "#729fcf"
        shape_record: "#c4a000"
        shape_block: "#729fcf"
        shape_filepath: "#acacae"
        shape_globpattern: "#c4a000"
        shape_variable: "#75507b"
        shape_flag: "#729fcf"
        shape_custom: "#ff7de9"
        shape_nothing: "#c4a000"
    }
}
