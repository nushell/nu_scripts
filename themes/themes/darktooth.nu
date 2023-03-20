export def main [] {
    # extra desired values for the darktooth theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1d2021"
    # foreground: "#a89984"
    # cursor: "#a89984"

    {
        # color for nushell primitives
        separator: "#fdf4c1"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#95c085"
        empty: "#0d6678"
        bool: "#fdf4c1"
        int: "#fdf4c1"
        filesize: "#fdf4c1"
        duration: "#fdf4c1"
        date: "#fdf4c1"
        range: "#fdf4c1"
        float: "#fdf4c1"
        string: "#fdf4c1"
        nothing: "#fdf4c1"
        binary: "#fdf4c1"
        cellpath: "#fdf4c1"
        row_index: "#95c085"
        record: "#fdf4c1"
        list: "#fdf4c1"
        block: "#fdf4c1"
        hints: "#665c54"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8f4673"
        shape_bool: "#8ba59b"
        shape_int: "#8f4673"
        shape_float: "#8f4673"
        shape_range: "#fac03b"
        shape_internalcall: "#8ba59b"
        shape_external: "#8ba59b"
        shape_externalarg: "#95c085"
        shape_literal: "#0d6678"
        shape_operator: "#fac03b"
        shape_signature: "#95c085"
        shape_string: "#95c085"
        shape_string_interpolation: "#8ba59b"
        shape_datetime: "#8ba59b"
        shape_list: "#8ba59b"
        shape_table: "#0d6678"
        shape_record: "#8ba59b"
        shape_block: "#0d6678"
        shape_filepath: "#8ba59b"
        shape_globpattern: "#8ba59b"
        shape_variable: "#8f4673"
        shape_flag: "#0d6678"
        shape_custom: "#95c085"
        shape_nothing: "#8ba59b"
    }
}
