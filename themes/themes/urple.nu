export def main [] {
    # extra desired values for the urple theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1b1b23"
    # foreground: "#877a9b"
    # cursor: "#877a9b"

    {
        # color for nushell primitives
        separator: "#bfa3ff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#29e620"
        empty: "#564d9b"
        bool: "#bfa3ff"
        int: "#bfa3ff"
        filesize: "#bfa3ff"
        duration: "#bfa3ff"
        date: "#bfa3ff"
        range: "#bfa3ff"
        float: "#bfa3ff"
        string: "#bfa3ff"
        nothing: "#bfa3ff"
        binary: "#bfa3ff"
        cellpath: "#bfa3ff"
        row_index: "#29e620"
        record: "#bfa3ff"
        list: "#bfa3ff"
        block: "#bfa3ff"
        hints: "#5d3225"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a05eee"
        shape_bool: "#eaeaea"
        shape_int: "#a05eee"
        shape_float: "#a05eee"
        shape_range: "#f08161"
        shape_internalcall: "#eaeaea"
        shape_external: "#808080"
        shape_externalarg: "#29e620"
        shape_literal: "#564d9b"
        shape_operator: "#ad5c42"
        shape_signature: "#29e620"
        shape_string: "#37a415"
        shape_string_interpolation: "#eaeaea"
        shape_datetime: "#eaeaea"
        shape_list: "#eaeaea"
        shape_table: "#867aed"
        shape_record: "#eaeaea"
        shape_block: "#867aed"
        shape_filepath: "#808080"
        shape_globpattern: "#eaeaea"
        shape_variable: "#6c3ca1"
        shape_flag: "#867aed"
        shape_custom: "#37a415"
        shape_nothing: "#eaeaea"
    }
}
