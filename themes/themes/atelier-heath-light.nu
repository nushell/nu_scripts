export def main [] {
    # extra desired values for the atelier_heath-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f7f3f7"
    # foreground: "#695d69"
    # cursor: "#695d69"

    {
        # color for nushell primitives
        separator: "#1b181b"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#918b3b"
        empty: "#516aec"
        bool: "#1b181b"
        int: "#1b181b"
        filesize: "#1b181b"
        duration: "#1b181b"
        date: "#1b181b"
        range: "#1b181b"
        float: "#1b181b"
        string: "#1b181b"
        nothing: "#1b181b"
        binary: "#1b181b"
        cellpath: "#1b181b"
        row_index: "#918b3b"
        record: "#1b181b"
        list: "#1b181b"
        block: "#1b181b"
        hints: "#9e8f9e"

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
