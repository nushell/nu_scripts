export def main [] {
    # extra desired values for the tempus_rift theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#162c22"
    # foreground: "#bbbcbc"
    # cursor: "#bbbcbc"

    {
        # color for nushell primitives
        separator: "#bbbcbc"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#6ac134"
        empty: "#30aeb0"
        bool: "#bbbcbc"
        int: "#bbbcbc"
        filesize: "#bbbcbc"
        duration: "#bbbcbc"
        date: "#bbbcbc"
        range: "#bbbcbc"
        float: "#bbbcbc"
        string: "#bbbcbc"
        nothing: "#bbbcbc"
        binary: "#bbbcbc"
        cellpath: "#bbbcbc"
        row_index: "#6ac134"
        record: "#bbbcbc"
        list: "#bbbcbc"
        block: "#bbbcbc"
        hints: "#283431"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#cca0ba"
        shape_bool: "#10c480"
        shape_int: "#cca0ba"
        shape_float: "#cca0ba"
        shape_range: "#82bd00"
        shape_internalcall: "#10c480"
        shape_external: "#5fad8f"
        shape_externalarg: "#6ac134"
        shape_literal: "#30aeb0"
        shape_operator: "#7fad00"
        shape_signature: "#6ac134"
        shape_string: "#34b534"
        shape_string_interpolation: "#10c480"
        shape_datetime: "#10c480"
        shape_list: "#10c480"
        shape_table: "#56bdad"
        shape_record: "#10c480"
        shape_block: "#56bdad"
        shape_filepath: "#5fad8f"
        shape_globpattern: "#10c480"
        shape_variable: "#c8954c"
        shape_flag: "#56bdad"
        shape_custom: "#34b534"
        shape_nothing: "#10c480"
    }
}
