export def main [] {
    # extra desired values for the warm_neon theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#404040"
    # foreground: "#afdab6"
    # cursor: "#afdab6"

    {
        # color for nushell primitives
        separator: "#d8c8bb"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#9cc090"
        empty: "#4261c5"
        bool: "#d8c8bb"
        int: "#d8c8bb"
        filesize: "#d8c8bb"
        duration: "#d8c8bb"
        date: "#d8c8bb"
        range: "#d8c8bb"
        float: "#d8c8bb"
        string: "#d8c8bb"
        nothing: "#d8c8bb"
        binary: "#d8c8bb"
        cellpath: "#d8c8bb"
        row_index: "#9cc090"
        record: "#d8c8bb"
        list: "#d8c8bb"
        block: "#d8c8bb"
        hints: "#fefcfc"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#f674ba"
        shape_bool: "#5ed1e5"
        shape_int: "#f674ba"
        shape_float: "#f674ba"
        shape_range: "#ddda7a"
        shape_internalcall: "#5ed1e5"
        shape_external: "#2abbd4"
        shape_externalarg: "#9cc090"
        shape_literal: "#4261c5"
        shape_operator: "#dae145"
        shape_signature: "#9cc090"
        shape_string: "#39b13a"
        shape_string_interpolation: "#5ed1e5"
        shape_datetime: "#5ed1e5"
        shape_list: "#5ed1e5"
        shape_table: "#7b91d6"
        shape_record: "#5ed1e5"
        shape_block: "#7b91d6"
        shape_filepath: "#2abbd4"
        shape_globpattern: "#5ed1e5"
        shape_variable: "#f920fb"
        shape_flag: "#7b91d6"
        shape_custom: "#39b13a"
        shape_nothing: "#5ed1e5"
    }
}
