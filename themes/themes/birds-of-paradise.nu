export def main [] {
    # extra desired values for the birds_of-paradise theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2a1f1d"
    # foreground: "#e0dbb7"
    # cursor: "#e0dbb7"

    {
        # color for nushell primitives
        separator: "#fff9d5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#95d8ba"
        empty: "#5a86ad"
        bool: "#fff9d5"
        int: "#fff9d5"
        filesize: "#fff9d5"
        duration: "#fff9d5"
        date: "#fff9d5"
        range: "#fff9d5"
        float: "#fff9d5"
        string: "#fff9d5"
        nothing: "#fff9d5"
        binary: "#fff9d5"
        cellpath: "#fff9d5"
        row_index: "#95d8ba"
        record: "#fff9d5"
        list: "#fff9d5"
        block: "#fff9d5"
        hints: "#9b6c4a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d19ecb"
        shape_bool: "#93cfd7"
        shape_int: "#d19ecb"
        shape_float: "#d19ecb"
        shape_range: "#d0d150"
        shape_internalcall: "#93cfd7"
        shape_external: "#74a6ad"
        shape_externalarg: "#95d8ba"
        shape_literal: "#5a86ad"
        shape_operator: "#e99d2a"
        shape_signature: "#95d8ba"
        shape_string: "#6ba18a"
        shape_string_interpolation: "#93cfd7"
        shape_datetime: "#93cfd7"
        shape_list: "#93cfd7"
        shape_table: "#b8d3ed"
        shape_record: "#93cfd7"
        shape_block: "#b8d3ed"
        shape_filepath: "#74a6ad"
        shape_globpattern: "#93cfd7"
        shape_variable: "#ac80a6"
        shape_flag: "#b8d3ed"
        shape_custom: "#6ba18a"
        shape_nothing: "#93cfd7"
    }
}
