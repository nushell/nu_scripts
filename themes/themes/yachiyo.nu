export def main [] {
    # extra desired values for the yachiyo theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#44515d"
    # foreground: "#ffb692"
    # cursor: "#ffb692"

    {
        # color for nushell primitives
        separator: "#a0be99"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b9a9d7"
        empty: "#ada883"
        bool: "#a0be99"
        int: "#a0be99"
        filesize: "#a0be99"
        duration: "#a0be99"
        date: "#a0be99"
        range: "#a0be99"
        float: "#a0be99"
        string: "#a0be99"
        nothing: "#a0be99"
        binary: "#a0be99"
        cellpath: "#a0be99"
        row_index: "#b9a9d7"
        record: "#a0be99"
        list: "#a0be99"
        block: "#a0be99"
        hints: "#ff509c"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9298e7"
        shape_bool: "#ff9c9c"
        shape_int: "#9298e7"
        shape_float: "#9298e7"
        shape_range: "#d4b34e"
        shape_internalcall: "#ff9c9c"
        shape_external: "#ff9c9c"
        shape_externalarg: "#b9a9d7"
        shape_literal: "#ada883"
        shape_operator: "#d4b34e"
        shape_signature: "#b9a9d7"
        shape_string: "#b9a9d7"
        shape_string_interpolation: "#ff9c9c"
        shape_datetime: "#ff9c9c"
        shape_list: "#ff9c9c"
        shape_table: "#ada883"
        shape_record: "#ff9c9c"
        shape_block: "#ada883"
        shape_filepath: "#ff9c9c"
        shape_globpattern: "#ff9c9c"
        shape_variable: "#9298e7"
        shape_flag: "#ada883"
        shape_custom: "#b9a9d7"
        shape_nothing: "#ff9c9c"
    }
}
