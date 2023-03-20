export def main [] {
    # extra desired values for the smyck theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#242424"
    # foreground: "#f7f7f7"
    # cursor: "#f7f7f7"

    {
        # color for nushell primitives
        separator: "#f7f7f7"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#cdee69"
        empty: "#72b3cc"
        bool: "#f7f7f7"
        int: "#f7f7f7"
        filesize: "#f7f7f7"
        duration: "#f7f7f7"
        date: "#f7f7f7"
        range: "#f7f7f7"
        float: "#f7f7f7"
        string: "#f7f7f7"
        nothing: "#f7f7f7"
        binary: "#f7f7f7"
        cellpath: "#f7f7f7"
        row_index: "#cdee69"
        record: "#f7f7f7"
        list: "#f7f7f7"
        block: "#f7f7f7"
        hints: "#5d5d5d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#fbb1f9"
        shape_bool: "#77dfd8"
        shape_int: "#fbb1f9"
        shape_float: "#fbb1f9"
        shape_range: "#ffe377"
        shape_internalcall: "#77dfd8"
        shape_external: "#218693"
        shape_externalarg: "#cdee69"
        shape_literal: "#72b3cc"
        shape_operator: "#d0b03c"
        shape_signature: "#cdee69"
        shape_string: "#8eb33b"
        shape_string_interpolation: "#77dfd8"
        shape_datetime: "#77dfd8"
        shape_list: "#77dfd8"
        shape_table: "#9cd9f0"
        shape_record: "#77dfd8"
        shape_block: "#9cd9f0"
        shape_filepath: "#218693"
        shape_globpattern: "#77dfd8"
        shape_variable: "#c8a0d1"
        shape_flag: "#9cd9f0"
        shape_custom: "#8eb33b"
        shape_nothing: "#77dfd8"
    }
}
