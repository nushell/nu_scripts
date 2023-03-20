export def main [] {
    # extra desired values for the pali theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#232e37"
    # foreground: "#d9e6f2"
    # cursor: "#d9e6f2"

    {
        # color for nushell primitives
        separator: "#a020f0"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#9cc3af"
        empty: "#8f74ab"
        bool: "#a020f0"
        int: "#a020f0"
        filesize: "#a020f0"
        duration: "#a020f0"
        date: "#a020f0"
        range: "#a020f0"
        float: "#a020f0"
        string: "#a020f0"
        nothing: "#a020f0"
        binary: "#a020f0"
        cellpath: "#a020f0"
        row_index: "#9cc3af"
        record: "#a020f0"
        list: "#a020f0"
        block: "#a020f0"
        hints: "#5d5d5d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff1d62"
        shape_bool: "#4bb8fd"
        shape_int: "#ff1d62"
        shape_float: "#ff1d62"
        shape_range: "#ffd00a"
        shape_internalcall: "#4bb8fd"
        shape_external: "#748fab"
        shape_externalarg: "#9cc3af"
        shape_literal: "#8f74ab"
        shape_operator: "#8fab74"
        shape_signature: "#9cc3af"
        shape_string: "#74ab8f"
        shape_string_interpolation: "#4bb8fd"
        shape_datetime: "#4bb8fd"
        shape_list: "#4bb8fd"
        shape_table: "#af9cc3"
        shape_record: "#4bb8fd"
        shape_block: "#af9cc3"
        shape_filepath: "#748fab"
        shape_globpattern: "#4bb8fd"
        shape_variable: "#ab748f"
        shape_flag: "#af9cc3"
        shape_custom: "#74ab8f"
        shape_nothing: "#4bb8fd"
    }
}
