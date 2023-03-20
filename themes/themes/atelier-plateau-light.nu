export def main [] {
    # extra desired values for the atelier_plateau-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f4ecec"
    # foreground: "#585050"
    # cursor: "#585050"

    {
        # color for nushell primitives
        separator: "#1b1818"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#4b8b8b"
        empty: "#7272ca"
        bool: "#1b1818"
        int: "#1b1818"
        filesize: "#1b1818"
        duration: "#1b1818"
        date: "#1b1818"
        range: "#1b1818"
        float: "#1b1818"
        string: "#1b1818"
        nothing: "#1b1818"
        binary: "#1b1818"
        cellpath: "#1b1818"
        row_index: "#4b8b8b"
        record: "#1b1818"
        list: "#1b1818"
        block: "#1b1818"
        hints: "#7e7777"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8464c4"
        shape_bool: "#5485b6"
        shape_int: "#8464c4"
        shape_float: "#8464c4"
        shape_range: "#a06e3b"
        shape_internalcall: "#5485b6"
        shape_external: "#5485b6"
        shape_externalarg: "#4b8b8b"
        shape_literal: "#7272ca"
        shape_operator: "#a06e3b"
        shape_signature: "#4b8b8b"
        shape_string: "#4b8b8b"
        shape_string_interpolation: "#5485b6"
        shape_datetime: "#5485b6"
        shape_list: "#5485b6"
        shape_table: "#7272ca"
        shape_record: "#5485b6"
        shape_block: "#7272ca"
        shape_filepath: "#5485b6"
        shape_globpattern: "#5485b6"
        shape_variable: "#8464c4"
        shape_flag: "#7272ca"
        shape_custom: "#4b8b8b"
        shape_nothing: "#5485b6"
    }
}
