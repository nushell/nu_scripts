export def main [] {
    # extra desired values for the tokyo_day theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#e1e2e7"
    # foreground: "#3760bf"
    # cursor: "#3760bf"

    {
        # color for nushell primitives
        separator: "#3760bf"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#587539"
        empty: "#2e7de9"
        bool: "#3760bf"
        int: "#3760bf"
        filesize: "#3760bf"
        duration: "#3760bf"
        date: "#3760bf"
        range: "#3760bf"
        float: "#3760bf"
        string: "#3760bf"
        nothing: "#3760bf"
        binary: "#3760bf"
        cellpath: "#3760bf"
        row_index: "#587539"
        record: "#3760bf"
        list: "#3760bf"
        block: "#3760bf"
        hints: "#a1a6c5"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9854f1"
        shape_bool: "#007197"
        shape_int: "#9854f1"
        shape_float: "#9854f1"
        shape_range: "#8c6c3e"
        shape_internalcall: "#007197"
        shape_external: "#007197"
        shape_externalarg: "#587539"
        shape_literal: "#2e7de9"
        shape_operator: "#8c6c3e"
        shape_signature: "#587539"
        shape_string: "#587539"
        shape_string_interpolation: "#007197"
        shape_datetime: "#007197"
        shape_list: "#007197"
        shape_table: "#2e7de9"
        shape_record: "#007197"
        shape_block: "#2e7de9"
        shape_filepath: "#007197"
        shape_globpattern: "#007197"
        shape_variable: "#9854f1"
        shape_flag: "#2e7de9"
        shape_custom: "#587539"
        shape_nothing: "#007197"
    }
}
