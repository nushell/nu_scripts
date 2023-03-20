export def main [] {
    # extra desired values for the horizon_terminal-dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1c1e26"
    # foreground: "#cbced0"
    # cursor: "#cbced0"

    {
        # color for nushell primitives
        separator: "#e3e6ee"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#29d398"
        empty: "#26bbd9"
        bool: "#e3e6ee"
        int: "#e3e6ee"
        filesize: "#e3e6ee"
        duration: "#e3e6ee"
        date: "#e3e6ee"
        range: "#e3e6ee"
        float: "#e3e6ee"
        string: "#e3e6ee"
        nothing: "#e3e6ee"
        binary: "#e3e6ee"
        cellpath: "#e3e6ee"
        row_index: "#29d398"
        record: "#e3e6ee"
        list: "#e3e6ee"
        block: "#e3e6ee"
        hints: "#6f6f70"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ee64ac"
        shape_bool: "#59e1e3"
        shape_int: "#ee64ac"
        shape_float: "#ee64ac"
        shape_range: "#fac29a"
        shape_internalcall: "#59e1e3"
        shape_external: "#59e1e3"
        shape_externalarg: "#29d398"
        shape_literal: "#26bbd9"
        shape_operator: "#fac29a"
        shape_signature: "#29d398"
        shape_string: "#29d398"
        shape_string_interpolation: "#59e1e3"
        shape_datetime: "#59e1e3"
        shape_list: "#59e1e3"
        shape_table: "#26bbd9"
        shape_record: "#59e1e3"
        shape_block: "#26bbd9"
        shape_filepath: "#59e1e3"
        shape_globpattern: "#59e1e3"
        shape_variable: "#ee64ac"
        shape_flag: "#26bbd9"
        shape_custom: "#29d398"
        shape_nothing: "#59e1e3"
    }
}
