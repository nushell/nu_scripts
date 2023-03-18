export def main [] {
    # extra desired values for the jackie_brown theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2c1d16"
    # foreground: "#ffcc2f"
    # cursor: "#ffcc2f"

    {
        # color for nushell primitives
        separator: "#e5e5e5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#86a93e"
        empty: "#246eb2"
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
        row_index: "#86a93e"
        record: "#e5e5e5"
        list: "#e5e5e5"
        block: "#e5e5e5"
        hints: "#666666"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#e500e5"
        shape_bool: "#00e5e5"
        shape_int: "#e500e5"
        shape_float: "#e500e5"
        shape_range: "#e5e500"
        shape_internalcall: "#00e5e5"
        shape_external: "#00acee"
        shape_externalarg: "#86a93e"
        shape_literal: "#246eb2"
        shape_operator: "#bebf00"
        shape_signature: "#86a93e"
        shape_string: "#2baf2b"
        shape_string_interpolation: "#00e5e5"
        shape_datetime: "#00e5e5"
        shape_list: "#00e5e5"
        shape_table: "#0000ff"
        shape_record: "#00e5e5"
        shape_block: "#0000ff"
        shape_filepath: "#00acee"
        shape_globpattern: "#00e5e5"
        shape_variable: "#d05ec1"
        shape_flag: "#0000ff"
        shape_custom: "#2baf2b"
        shape_nothing: "#00e5e5"
    }
}
