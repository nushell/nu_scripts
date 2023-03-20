export def main [] {
    # extra desired values for the elio theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#041a3b"
    # foreground: "#f2f2f2"
    # cursor: "#f2f2f2"

    {
        # color for nushell primitives
        separator: "#a020f0"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7bc91f"
        empty: "#729fcf"
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
        row_index: "#7bc91f"
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
        shape_external: "#2aa7e7"
        shape_externalarg: "#7bc91f"
        shape_literal: "#729fcf"
        shape_operator: "#ffc005"
        shape_signature: "#7bc91f"
        shape_string: "#6ab017"
        shape_string_interpolation: "#4bb8fd"
        shape_datetime: "#4bb8fd"
        shape_list: "#4bb8fd"
        shape_table: "#0071ff"
        shape_record: "#4bb8fd"
        shape_block: "#0071ff"
        shape_filepath: "#2aa7e7"
        shape_globpattern: "#4bb8fd"
        shape_variable: "#ec0048"
        shape_flag: "#0071ff"
        shape_custom: "#6ab017"
        shape_nothing: "#4bb8fd"
    }
}
