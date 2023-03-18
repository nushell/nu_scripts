export def main [] {
    # extra desired values for the gruvbox theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#fbf1c7"
    # foreground: "#3c3836"
    # cursor: "#3c3836"

    {
        # color for nushell primitives
        separator: "#3c3836"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#79740e"
        empty: "#458588"
        bool: "#3c3836"
        int: "#3c3836"
        filesize: "#3c3836"
        duration: "#3c3836"
        date: "#3c3836"
        range: "#3c3836"
        float: "#3c3836"
        string: "#3c3836"
        nothing: "#3c3836"
        binary: "#3c3836"
        cellpath: "#3c3836"
        row_index: "#79740e"
        record: "#3c3836"
        list: "#3c3836"
        block: "#3c3836"
        hints: "#928374"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8f3f71"
        shape_bool: "#427b58"
        shape_int: "#8f3f71"
        shape_float: "#8f3f71"
        shape_range: "#b57614"
        shape_internalcall: "#427b58"
        shape_external: "#689d6a"
        shape_externalarg: "#79740e"
        shape_literal: "#458588"
        shape_operator: "#d79921"
        shape_signature: "#79740e"
        shape_string: "#98971a"
        shape_string_interpolation: "#427b58"
        shape_datetime: "#427b58"
        shape_list: "#427b58"
        shape_table: "#076678"
        shape_record: "#427b58"
        shape_block: "#076678"
        shape_filepath: "#689d6a"
        shape_globpattern: "#427b58"
        shape_variable: "#b16286"
        shape_flag: "#076678"
        shape_custom: "#98971a"
        shape_nothing: "#427b58"
    }
}
