export def main [] {
    # extra desired values for the everforest theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2f383e"
    # foreground: "#d3c6aa"
    # cursor: "#d3c6aa"

    {
        # color for nushell primitives
        separator: "#d3c6aa"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a7c080"
        empty: "#7fbbb3"
        bool: "#d3c6aa"
        int: "#d3c6aa"
        filesize: "#d3c6aa"
        duration: "#d3c6aa"
        date: "#d3c6aa"
        range: "#d3c6aa"
        float: "#d3c6aa"
        string: "#d3c6aa"
        nothing: "#d3c6aa"
        binary: "#d3c6aa"
        cellpath: "#d3c6aa"
        row_index: "#a7c080"
        record: "#d3c6aa"
        list: "#d3c6aa"
        block: "#d3c6aa"
        hints: "#4b565c"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d699b6"
        shape_bool: "#83c092"
        shape_int: "#d699b6"
        shape_float: "#d699b6"
        shape_range: "#dbbc7f"
        shape_internalcall: "#83c092"
        shape_external: "#83c092"
        shape_externalarg: "#a7c080"
        shape_literal: "#7fbbb3"
        shape_operator: "#dbbc7f"
        shape_signature: "#a7c080"
        shape_string: "#a7c080"
        shape_string_interpolation: "#83c092"
        shape_datetime: "#83c092"
        shape_list: "#83c092"
        shape_table: "#7fbbb3"
        shape_record: "#83c092"
        shape_block: "#7fbbb3"
        shape_filepath: "#83c092"
        shape_globpattern: "#83c092"
        shape_variable: "#d699b6"
        shape_flag: "#7fbbb3"
        shape_custom: "#a7c080"
        shape_nothing: "#83c092"
    }
}
