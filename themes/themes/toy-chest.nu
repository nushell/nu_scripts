export def main [] {
    # extra desired values for the toy_chest theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#24364b"
    # foreground: "#31d07b"
    # cursor: "#31d07b"

    {
        # color for nushell primitives
        separator: "#d5d5d5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#31d07b"
        empty: "#325d96"
        bool: "#d5d5d5"
        int: "#d5d5d5"
        filesize: "#d5d5d5"
        duration: "#d5d5d5"
        date: "#d5d5d5"
        range: "#d5d5d5"
        float: "#d5d5d5"
        string: "#d5d5d5"
        nothing: "#d5d5d5"
        binary: "#d5d5d5"
        cellpath: "#d5d5d5"
        row_index: "#31d07b"
        record: "#d5d5d5"
        list: "#d5d5d5"
        block: "#d5d5d5"
        hints: "#336889"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ae6bdc"
        shape_bool: "#42c3ae"
        shape_int: "#ae6bdc"
        shape_float: "#ae6bdc"
        shape_range: "#e7d84b"
        shape_internalcall: "#42c3ae"
        shape_external: "#35a08f"
        shape_externalarg: "#31d07b"
        shape_literal: "#325d96"
        shape_operator: "#db8e27"
        shape_signature: "#31d07b"
        shape_string: "#1a9172"
        shape_string_interpolation: "#42c3ae"
        shape_datetime: "#42c3ae"
        shape_list: "#42c3ae"
        shape_table: "#34a6da"
        shape_record: "#42c3ae"
        shape_block: "#34a6da"
        shape_filepath: "#35a08f"
        shape_globpattern: "#42c3ae"
        shape_variable: "#8a5edc"
        shape_flag: "#34a6da"
        shape_custom: "#1a9172"
        shape_nothing: "#42c3ae"
    }
}
