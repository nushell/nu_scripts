export def main [] {
    # extra desired values for the mocha theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#3b3228"
    # foreground: "#d0c8c6"
    # cursor: "#d0c8c6"

    {
        # color for nushell primitives
        separator: "#f5eeeb"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#beb55b"
        empty: "#8ab3b5"
        bool: "#f5eeeb"
        int: "#f5eeeb"
        filesize: "#f5eeeb"
        duration: "#f5eeeb"
        date: "#f5eeeb"
        range: "#f5eeeb"
        float: "#f5eeeb"
        string: "#f5eeeb"
        nothing: "#f5eeeb"
        binary: "#f5eeeb"
        cellpath: "#f5eeeb"
        row_index: "#beb55b"
        record: "#f5eeeb"
        list: "#f5eeeb"
        block: "#f5eeeb"
        hints: "#7e705a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a89bb9"
        shape_bool: "#7bbda4"
        shape_int: "#a89bb9"
        shape_float: "#a89bb9"
        shape_range: "#f4bc87"
        shape_internalcall: "#7bbda4"
        shape_external: "#7bbda4"
        shape_externalarg: "#beb55b"
        shape_literal: "#8ab3b5"
        shape_operator: "#f4bc87"
        shape_signature: "#beb55b"
        shape_string: "#beb55b"
        shape_string_interpolation: "#7bbda4"
        shape_datetime: "#7bbda4"
        shape_list: "#7bbda4"
        shape_table: "#8ab3b5"
        shape_record: "#7bbda4"
        shape_block: "#8ab3b5"
        shape_filepath: "#7bbda4"
        shape_globpattern: "#7bbda4"
        shape_variable: "#a89bb9"
        shape_flag: "#8ab3b5"
        shape_custom: "#beb55b"
        shape_nothing: "#7bbda4"
    }
}
