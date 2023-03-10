export def main [] {
    # extra desired values for the snow_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2c2d30"
    # foreground: "#afb7c0"
    # cursor: "#cbd2d9"

    {
        # color for nushell primitives
        separator: "#cbd2d9"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7f9d77"
        empty: "#759abd"
        bool: "#cbd2d9"
        int: "#cbd2d9"
        filesize: "#cbd2d9"
        duration: "#cbd2d9"
        date: "#cbd2d9"
        range: "#cbd2d9"
        float: "#cbd2d9"
        string: "#cbd2d9"
        nothing: "#cbd2d9"
        binary: "#cbd2d9"
        cellpath: "#cbd2d9"
        row_index: "#7f9d77"
        record: "#cbd2d9"
        list: "#cbd2d9"
        block: "#cbd2d9"
        hints: "#363a3e"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a88cb3"
        shape_bool: "#5da19f"
        shape_int: "#a88cb3"
        shape_float: "#a88cb3"
        shape_range: "#ab916d"
        shape_internalcall: "#5da19f"
        shape_external: "#5da19f"
        shape_externalarg: "#7f9d77"
        shape_literal: "#759abd"
        shape_operator: "#ab916d"
        shape_signature: "#7f9d77"
        shape_string: "#7f9d77"
        shape_string_interpolation: "#5da19f"
        shape_datetime: "#5da19f"
        shape_list: "#5da19f"
        shape_table: "#759abd"
        shape_record: "#5da19f"
        shape_block: "#759abd"
        shape_filepath: "#5da19f"
        shape_globpattern: "#5da19f"
        shape_variable: "#a88cb3"
        shape_flag: "#759abd"
        shape_custom: "#7f9d77"
        shape_nothing: "#5da19f"
    }
}
