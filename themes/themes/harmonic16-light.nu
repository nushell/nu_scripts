export def main [] {
    # extra desired values for the harmonic16_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f7f9fb"
    # foreground: "#405c79"
    # cursor: "#405c79"

    {
        # color for nushell primitives
        separator: "#0b1c2c"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#56bf8b"
        empty: "#8b56bf"
        bool: "#0b1c2c"
        int: "#0b1c2c"
        filesize: "#0b1c2c"
        duration: "#0b1c2c"
        date: "#0b1c2c"
        range: "#0b1c2c"
        float: "#0b1c2c"
        string: "#0b1c2c"
        nothing: "#0b1c2c"
        binary: "#0b1c2c"
        cellpath: "#0b1c2c"
        row_index: "#56bf8b"
        record: "#0b1c2c"
        list: "#0b1c2c"
        block: "#0b1c2c"
        hints: "#aabcce"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#bf568b"
        shape_bool: "#568bbf"
        shape_int: "#bf568b"
        shape_float: "#bf568b"
        shape_range: "#8bbf56"
        shape_internalcall: "#568bbf"
        shape_external: "#568bbf"
        shape_externalarg: "#56bf8b"
        shape_literal: "#8b56bf"
        shape_operator: "#8bbf56"
        shape_signature: "#56bf8b"
        shape_string: "#56bf8b"
        shape_string_interpolation: "#568bbf"
        shape_datetime: "#568bbf"
        shape_list: "#568bbf"
        shape_table: "#8b56bf"
        shape_record: "#568bbf"
        shape_block: "#8b56bf"
        shape_filepath: "#568bbf"
        shape_globpattern: "#568bbf"
        shape_variable: "#bf568b"
        shape_flag: "#8b56bf"
        shape_custom: "#56bf8b"
        shape_nothing: "#568bbf"
    }
}
