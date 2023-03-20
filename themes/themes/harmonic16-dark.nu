export def main [] {
    # extra desired values for the harmonic16_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0b1c2c"
    # foreground: "#cbd6e2"
    # cursor: "#cbd6e2"

    {
        # color for nushell primitives
        separator: "#f7f9fb"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#56bf8b"
        empty: "#8b56bf"
        bool: "#f7f9fb"
        int: "#f7f9fb"
        filesize: "#f7f9fb"
        duration: "#f7f9fb"
        date: "#f7f9fb"
        range: "#f7f9fb"
        float: "#f7f9fb"
        string: "#f7f9fb"
        nothing: "#f7f9fb"
        binary: "#f7f9fb"
        cellpath: "#f7f9fb"
        row_index: "#56bf8b"
        record: "#f7f9fb"
        list: "#f7f9fb"
        block: "#f7f9fb"
        hints: "#627e99"

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
