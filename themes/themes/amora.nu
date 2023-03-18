export def main [] {
    # extra desired values for the amora theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2a2331"
    # foreground: "#dedbeb"
    # cursor: "#dedbeb"

    {
        # color for nushell primitives
        separator: "#edebf7"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#bfd1c3"
        empty: "#9985d1"
        bool: "#edebf7"
        int: "#edebf7"
        filesize: "#edebf7"
        duration: "#edebf7"
        date: "#edebf7"
        range: "#edebf7"
        float: "#edebf7"
        string: "#edebf7"
        nothing: "#edebf7"
        binary: "#edebf7"
        cellpath: "#edebf7"
        row_index: "#bfd1c3"
        record: "#edebf7"
        list: "#edebf7"
        block: "#edebf7"
        hints: "#302838"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#edabd2"
        shape_bool: "#c4d1f5"
        shape_int: "#edabd2"
        shape_float: "#edabd2"
        shape_range: "#f0ddd8"
        shape_internalcall: "#c4d1f5"
        shape_external: "#aabae7"
        shape_externalarg: "#bfd1c3"
        shape_literal: "#9985d1"
        shape_operator: "#eacac0"
        shape_signature: "#bfd1c3"
        shape_string: "#a2baa8"
        shape_string_interpolation: "#c4d1f5"
        shape_datetime: "#c4d1f5"
        shape_list: "#c4d1f5"
        shape_table: "#b4a4de"
        shape_record: "#c4d1f5"
        shape_block: "#b4a4de"
        shape_filepath: "#aabae7"
        shape_globpattern: "#c4d1f5"
        shape_variable: "#e68ac1"
        shape_flag: "#b4a4de"
        shape_custom: "#a2baa8"
        shape_nothing: "#c4d1f5"
    }
}
