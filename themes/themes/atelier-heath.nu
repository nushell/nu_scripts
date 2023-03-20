export def main [] {
    # extra desired values for the atelier_heath theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1b181b"
    # foreground: "#ab9bab"
    # cursor: "#ab9bab"

    {
        # color for nushell primitives
        separator: "#f7f3f7"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#918b3b"
        empty: "#516aec"
        bool: "#f7f3f7"
        int: "#f7f3f7"
        filesize: "#f7f3f7"
        duration: "#f7f3f7"
        date: "#f7f3f7"
        range: "#f7f3f7"
        float: "#f7f3f7"
        string: "#f7f3f7"
        nothing: "#f7f3f7"
        binary: "#f7f3f7"
        cellpath: "#f7f3f7"
        row_index: "#918b3b"
        record: "#f7f3f7"
        list: "#f7f3f7"
        block: "#f7f3f7"
        hints: "#776977"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#7b59c0"
        shape_bool: "#159393"
        shape_int: "#7b59c0"
        shape_float: "#7b59c0"
        shape_range: "#bb8a35"
        shape_internalcall: "#159393"
        shape_external: "#159393"
        shape_externalarg: "#918b3b"
        shape_literal: "#516aec"
        shape_operator: "#bb8a35"
        shape_signature: "#918b3b"
        shape_string: "#918b3b"
        shape_string_interpolation: "#159393"
        shape_datetime: "#159393"
        shape_list: "#159393"
        shape_table: "#516aec"
        shape_record: "#159393"
        shape_block: "#516aec"
        shape_filepath: "#159393"
        shape_globpattern: "#159393"
        shape_variable: "#7b59c0"
        shape_flag: "#516aec"
        shape_custom: "#918b3b"
        shape_nothing: "#159393"
    }
}
