export def main [] {
    # extra desired values for the spacedust theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0a1e24"
    # foreground: "#ecf0c1"
    # cursor: "#ecf0c1"

    {
        # color for nushell primitives
        separator: "#fefff1"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#aecab8"
        empty: "#0f548b"
        bool: "#fefff1"
        int: "#fefff1"
        filesize: "#fefff1"
        duration: "#fefff1"
        date: "#fefff1"
        range: "#fefff1"
        float: "#fefff1"
        string: "#fefff1"
        nothing: "#fefff1"
        binary: "#fefff1"
        cellpath: "#fefff1"
        row_index: "#aecab8"
        record: "#fefff1"
        list: "#fefff1"
        block: "#fefff1"
        hints: "#684c31"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff8a3a"
        shape_bool: "#83a7b4"
        shape_int: "#ff8a3a"
        shape_float: "#ff8a3a"
        shape_range: "#ffc878"
        shape_internalcall: "#83a7b4"
        shape_external: "#06afc7"
        shape_externalarg: "#aecab8"
        shape_literal: "#0f548b"
        shape_operator: "#e3cd7b"
        shape_signature: "#aecab8"
        shape_string: "#5cab96"
        shape_string_interpolation: "#83a7b4"
        shape_datetime: "#83a7b4"
        shape_list: "#83a7b4"
        shape_table: "#67a0ce"
        shape_record: "#83a7b4"
        shape_block: "#67a0ce"
        shape_filepath: "#06afc7"
        shape_globpattern: "#83a7b4"
        shape_variable: "#e35b00"
        shape_flag: "#67a0ce"
        shape_custom: "#5cab96"
        shape_nothing: "#83a7b4"
    }
}
