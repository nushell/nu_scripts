export def main [] {
    # extra desired values for the abyss theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#040f18"
    # foreground: "#c0c7ca"
    # cursor: "#10598b"

    {
        # color for nushell primitives
        separator: "#a0cce2"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#10598b"
        empty: "#277bb1"
        bool: "#a0cce2"
        int: "#a0cce2"
        filesize: "#a0cce2"
        duration: "#a0cce2"
        date: "#a0cce2"
        range: "#a0cce2"
        float: "#a0cce2"
        string: "#a0cce2"
        nothing: "#a0cce2"
        binary: "#a0cce2"
        cellpath: "#a0cce2"
        row_index: "#10598b"
        record: "#a0cce2"
        list: "#a0cce2"
        block: "#a0cce2"
        hints: "#708e9e"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#4595bd"
        shape_bool: "#2592d3"
        shape_int: "#4595bd"
        shape_float: "#4595bd"
        shape_range: "#1f6ca1"
        shape_internalcall: "#2592d3"
        shape_external: "#2592d3"
        shape_externalarg: "#10598b"
        shape_literal: "#277bb1"
        shape_operator: "#1f6ca1"
        shape_signature: "#10598b"
        shape_string: "#10598b"
        shape_string_interpolation: "#2592d3"
        shape_datetime: "#2592d3"
        shape_list: "#2592d3"
        shape_table: "#277bb1"
        shape_record: "#2592d3"
        shape_block: "#277bb1"
        shape_filepath: "#2592d3"
        shape_globpattern: "#2592d3"
        shape_variable: "#4595bd"
        shape_flag: "#277bb1"
        shape_custom: "#10598b"
        shape_nothing: "#2592d3"
    }
}
