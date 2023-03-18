export def main [] {
    # extra desired values for the falcon theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#020221"
    # foreground: "#b4b4b9"
    # cursor: "#ffe8c0"

    {
        # color for nushell primitives
        separator: "#f8f8ff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b1bf75"
        empty: "#635196"
        bool: "#f8f8ff"
        int: "#f8f8ff"
        filesize: "#f8f8ff"
        duration: "#f8f8ff"
        date: "#f8f8ff"
        range: "#f8f8ff"
        float: "#f8f8ff"
        string: "#f8f8ff"
        nothing: "#f8f8ff"
        binary: "#f8f8ff"
        cellpath: "#f8f8ff"
        row_index: "#b1bf75"
        record: "#f8f8ff"
        list: "#f8f8ff"
        block: "#f8f8ff"
        hints: "#020221"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ffb07b"
        shape_bool: "#8bccbf"
        shape_int: "#ffb07b"
        shape_float: "#ffb07b"
        shape_range: "#ffd392"
        shape_internalcall: "#8bccbf"
        shape_external: "#34bfa4"
        shape_externalarg: "#b1bf75"
        shape_literal: "#635196"
        shape_operator: "#ffc552"
        shape_signature: "#b1bf75"
        shape_string: "#718e3f"
        shape_string_interpolation: "#8bccbf"
        shape_datetime: "#8bccbf"
        shape_list: "#8bccbf"
        shape_table: "#99a4bc"
        shape_record: "#8bccbf"
        shape_block: "#99a4bc"
        shape_filepath: "#34bfa4"
        shape_globpattern: "#8bccbf"
        shape_variable: "#ff761a"
        shape_flag: "#99a4bc"
        shape_custom: "#718e3f"
        shape_nothing: "#8bccbf"
    }
}
