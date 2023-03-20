export def main [] {
    # extra desired values for the helios theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1d2021"
    # foreground: "#d5d5d5"
    # cursor: "#d5d5d5"

    {
        # color for nushell primitives
        separator: "#e5e5e5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#88b92d"
        empty: "#1e8bac"
        bool: "#e5e5e5"
        int: "#e5e5e5"
        filesize: "#e5e5e5"
        duration: "#e5e5e5"
        date: "#e5e5e5"
        range: "#e5e5e5"
        float: "#e5e5e5"
        string: "#e5e5e5"
        nothing: "#e5e5e5"
        binary: "#e5e5e5"
        cellpath: "#e5e5e5"
        row_index: "#88b92d"
        record: "#e5e5e5"
        list: "#e5e5e5"
        block: "#e5e5e5"
        hints: "#6f7579"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#be4264"
        shape_bool: "#1ba595"
        shape_int: "#be4264"
        shape_float: "#be4264"
        shape_range: "#f19d1a"
        shape_internalcall: "#1ba595"
        shape_external: "#1ba595"
        shape_externalarg: "#88b92d"
        shape_literal: "#1e8bac"
        shape_operator: "#f19d1a"
        shape_signature: "#88b92d"
        shape_string: "#88b92d"
        shape_string_interpolation: "#1ba595"
        shape_datetime: "#1ba595"
        shape_list: "#1ba595"
        shape_table: "#1e8bac"
        shape_record: "#1ba595"
        shape_block: "#1e8bac"
        shape_filepath: "#1ba595"
        shape_globpattern: "#1ba595"
        shape_variable: "#be4264"
        shape_flag: "#1e8bac"
        shape_custom: "#88b92d"
        shape_nothing: "#1ba595"
    }
}
