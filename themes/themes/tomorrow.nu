export def main [] {
    # extra desired values for the tomorrow theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ffffff"
    # foreground: "#4d4d4c"
    # cursor: "#4d4d4c"

    {
        # color for nushell primitives
        separator: "#1d1f21"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#718c00"
        empty: "#4271ae"
        bool: "#1d1f21"
        int: "#1d1f21"
        filesize: "#1d1f21"
        duration: "#1d1f21"
        date: "#1d1f21"
        range: "#1d1f21"
        float: "#1d1f21"
        string: "#1d1f21"
        nothing: "#1d1f21"
        binary: "#1d1f21"
        cellpath: "#1d1f21"
        row_index: "#718c00"
        record: "#1d1f21"
        list: "#1d1f21"
        block: "#1d1f21"
        hints: "#8e908c"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8959a8"
        shape_bool: "#3e999f"
        shape_int: "#8959a8"
        shape_float: "#8959a8"
        shape_range: "#eab700"
        shape_internalcall: "#3e999f"
        shape_external: "#3e999f"
        shape_externalarg: "#718c00"
        shape_literal: "#4271ae"
        shape_operator: "#eab700"
        shape_signature: "#718c00"
        shape_string: "#718c00"
        shape_string_interpolation: "#3e999f"
        shape_datetime: "#3e999f"
        shape_list: "#3e999f"
        shape_table: "#4271ae"
        shape_record: "#3e999f"
        shape_block: "#4271ae"
        shape_filepath: "#3e999f"
        shape_globpattern: "#3e999f"
        shape_variable: "#8959a8"
        shape_flag: "#4271ae"
        shape_custom: "#718c00"
        shape_nothing: "#3e999f"
    }
}
