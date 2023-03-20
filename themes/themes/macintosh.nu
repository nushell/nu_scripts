export def main [] {
    # extra desired values for the macintosh theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#c0c0c0"
    # cursor: "#c0c0c0"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#1fb714"
        empty: "#0000d3"
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
        row_index: "#1fb714"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#808080"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#4700a5"
        shape_bool: "#02abea"
        shape_int: "#4700a5"
        shape_float: "#4700a5"
        shape_range: "#fbf305"
        shape_internalcall: "#02abea"
        shape_external: "#02abea"
        shape_externalarg: "#1fb714"
        shape_literal: "#0000d3"
        shape_operator: "#fbf305"
        shape_signature: "#1fb714"
        shape_string: "#1fb714"
        shape_string_interpolation: "#02abea"
        shape_datetime: "#02abea"
        shape_list: "#02abea"
        shape_table: "#0000d3"
        shape_record: "#02abea"
        shape_block: "#0000d3"
        shape_filepath: "#02abea"
        shape_globpattern: "#02abea"
        shape_variable: "#4700a5"
        shape_flag: "#0000d3"
        shape_custom: "#1fb714"
        shape_nothing: "#02abea"
    }
}
