export def main [] {
    # extra desired values for the wombat theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#171717"
    # foreground: "#dedacf"
    # cursor: "#dedacf"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#ddf88f"
        empty: "#5da9f6"
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
        row_index: "#ddf88f"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#313131"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ddaaff"
        shape_bool: "#b7fff9"
        shape_int: "#ddaaff"
        shape_float: "#ddaaff"
        shape_range: "#eee5b2"
        shape_internalcall: "#b7fff9"
        shape_external: "#82fff7"
        shape_externalarg: "#ddf88f"
        shape_literal: "#5da9f6"
        shape_operator: "#ebd99c"
        shape_signature: "#ddf88f"
        shape_string: "#b1e969"
        shape_string_interpolation: "#b7fff9"
        shape_datetime: "#b7fff9"
        shape_list: "#b7fff9"
        shape_table: "#a5c7ff"
        shape_record: "#b7fff9"
        shape_block: "#a5c7ff"
        shape_filepath: "#82fff7"
        shape_globpattern: "#b7fff9"
        shape_variable: "#e86aff"
        shape_flag: "#a5c7ff"
        shape_custom: "#b1e969"
        shape_nothing: "#b7fff9"
    }
}
