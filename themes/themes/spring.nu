export def main [] {
    # extra desired values for the spring theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0a1e24"
    # foreground: "#ecf0c1"
    # cursor: "#ecf0c1"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#1fc231"
        empty: "#1dd3ee"
        bool: "#ffffff"
        int: "#ffffff"
        filesize: "#ffffff"
        duration: "#ffffff"
        date: "#ffffff"
        range: "#ffffff"
        float: "#ffffff"
        string: "#ffffff"
        nothing: "#ffffff"
        binary: "#ffffff"
        cellpath: "#ffffff"
        row_index: "#1fc231"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#000000"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8959a8"
        shape_bool: "#3e999f"
        shape_int: "#8959a8"
        shape_float: "#8959a8"
        shape_range: "#d5b807"
        shape_internalcall: "#3e999f"
        shape_external: "#3e999f"
        shape_externalarg: "#1fc231"
        shape_literal: "#1dd3ee"
        shape_operator: "#1fc95b"
        shape_signature: "#1fc231"
        shape_string: "#1f8c3b"
        shape_string_interpolation: "#3e999f"
        shape_datetime: "#3e999f"
        shape_list: "#3e999f"
        shape_table: "#15a9fd"
        shape_record: "#3e999f"
        shape_block: "#15a9fd"
        shape_filepath: "#3e999f"
        shape_globpattern: "#3e999f"
        shape_variable: "#8959a8"
        shape_flag: "#15a9fd"
        shape_custom: "#1f8c3b"
        shape_nothing: "#3e999f"
    }
}
