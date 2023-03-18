export def main [] {
    # extra desired values for the black_metal-venom theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#c1c1c1"
    # cursor: "#c1c1c1"

    {
        # color for nushell primitives
        separator: "#c1c1c1"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#f8f7f2"
        empty: "#888888"
        bool: "#c1c1c1"
        int: "#c1c1c1"
        filesize: "#c1c1c1"
        duration: "#c1c1c1"
        date: "#c1c1c1"
        range: "#c1c1c1"
        float: "#c1c1c1"
        string: "#c1c1c1"
        nothing: "#c1c1c1"
        binary: "#c1c1c1"
        cellpath: "#c1c1c1"
        row_index: "#f8f7f2"
        record: "#c1c1c1"
        list: "#c1c1c1"
        block: "#c1c1c1"
        hints: "#333333"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#999999"
        shape_bool: "#aaaaaa"
        shape_int: "#999999"
        shape_float: "#999999"
        shape_range: "#79241f"
        shape_internalcall: "#aaaaaa"
        shape_external: "#aaaaaa"
        shape_externalarg: "#f8f7f2"
        shape_literal: "#888888"
        shape_operator: "#79241f"
        shape_signature: "#f8f7f2"
        shape_string: "#f8f7f2"
        shape_string_interpolation: "#aaaaaa"
        shape_datetime: "#aaaaaa"
        shape_list: "#aaaaaa"
        shape_table: "#888888"
        shape_record: "#aaaaaa"
        shape_block: "#888888"
        shape_filepath: "#aaaaaa"
        shape_globpattern: "#aaaaaa"
        shape_variable: "#999999"
        shape_flag: "#888888"
        shape_custom: "#f8f7f2"
        shape_nothing: "#aaaaaa"
    }
}
