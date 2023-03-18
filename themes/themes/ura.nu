export def main [] {
    # extra desired values for the ura theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#feffee"
    # foreground: "#23476a"
    # cursor: "#23476a"

    {
        # color for nushell primitives
        separator: "#e5e5e5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b9ee84"
        empty: "#1b6fc2"
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
        row_index: "#b9ee84"
        record: "#e5e5e5"
        list: "#e5e5e5"
        block: "#e5e5e5"
        hints: "#808080"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b984ee"
        shape_bool: "#84eeb9"
        shape_int: "#b984ee"
        shape_float: "#b984ee"
        shape_range: "#eeb984"
        shape_internalcall: "#84eeb9"
        shape_external: "#1bc26f"
        shape_externalarg: "#b9ee84"
        shape_literal: "#1b6fc2"
        shape_operator: "#c26f1b"
        shape_signature: "#b9ee84"
        shape_string: "#6fc21b"
        shape_string_interpolation: "#84eeb9"
        shape_datetime: "#84eeb9"
        shape_list: "#84eeb9"
        shape_table: "#84b9ee"
        shape_record: "#84eeb9"
        shape_block: "#84b9ee"
        shape_filepath: "#1bc26f"
        shape_globpattern: "#84eeb9"
        shape_variable: "#6f1bc2"
        shape_flag: "#84b9ee"
        shape_custom: "#6fc21b"
        shape_nothing: "#84eeb9"
    }
}
