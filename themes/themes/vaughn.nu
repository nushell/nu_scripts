export def main [] {
    # extra desired values for the vaughn theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#25234f"
    # foreground: "#dcdccc"
    # cursor: "#dcdccc"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#60b48a"
        empty: "#5555ff"
        bool: "#ffffff"
        int: "#ffffff"
        filesize: "#ffffff"
        duration: "#ffffff"
        date: "#ffffff"
        range: "#ffffff"
        float: "#ffffff"
        string: "#ffffff"
        nothing: "#ffffff"
        binary: "#ffffff"
        cellpath: "#ffffff"
        row_index: "#60b48a"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#709080"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ec93d3"
        shape_bool: "#93e0e3"
        shape_int: "#ec93d3"
        shape_float: "#ec93d3"
        shape_range: "#f0dfaf"
        shape_internalcall: "#93e0e3"
        shape_external: "#8cd0d3"
        shape_externalarg: "#60b48a"
        shape_literal: "#5555ff"
        shape_operator: "#dfaf8f"
        shape_signature: "#60b48a"
        shape_string: "#60b48a"
        shape_string_interpolation: "#93e0e3"
        shape_datetime: "#93e0e3"
        shape_list: "#93e0e3"
        shape_table: "#5555ff"
        shape_record: "#93e0e3"
        shape_block: "#5555ff"
        shape_filepath: "#8cd0d3"
        shape_globpattern: "#93e0e3"
        shape_variable: "#f08cc3"
        shape_flag: "#5555ff"
        shape_custom: "#60b48a"
        shape_nothing: "#93e0e3"
    }
}
