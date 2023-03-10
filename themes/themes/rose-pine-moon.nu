export def main [] {
    # extra desired values for the rose_pine-moon theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#232136"
    # foreground: "#e0def4"
    # cursor: "#e0def4"

    {
        # color for nushell primitives
        separator: "#d9d7e1"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#ea9a97"
        empty: "#9ccfd8"
        bool: "#d9d7e1"
        int: "#d9d7e1"
        filesize: "#d9d7e1"
        duration: "#d9d7e1"
        date: "#d9d7e1"
        range: "#d9d7e1"
        float: "#d9d7e1"
        string: "#d9d7e1"
        nothing: "#d9d7e1"
        binary: "#d9d7e1"
        cellpath: "#d9d7e1"
        row_index: "#ea9a97"
        record: "#d9d7e1"
        list: "#d9d7e1"
        block: "#d9d7e1"
        hints: "#59546d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c4a7e7"
        shape_bool: "#3e8fb0"
        shape_int: "#c4a7e7"
        shape_float: "#c4a7e7"
        shape_range: "#f6c177"
        shape_internalcall: "#3e8fb0"
        shape_external: "#3e8fb0"
        shape_externalarg: "#ea9a97"
        shape_literal: "#9ccfd8"
        shape_operator: "#f6c177"
        shape_signature: "#ea9a97"
        shape_string: "#ea9a97"
        shape_string_interpolation: "#3e8fb0"
        shape_datetime: "#3e8fb0"
        shape_list: "#3e8fb0"
        shape_table: "#9ccfd8"
        shape_record: "#3e8fb0"
        shape_block: "#9ccfd8"
        shape_filepath: "#3e8fb0"
        shape_globpattern: "#3e8fb0"
        shape_variable: "#c4a7e7"
        shape_flag: "#9ccfd8"
        shape_custom: "#ea9a97"
        shape_nothing: "#3e8fb0"
    }
}
