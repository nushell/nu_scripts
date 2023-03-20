export def main [] {
    # extra desired values for the atelier_estuary theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#22221b"
    # foreground: "#929181"
    # cursor: "#929181"

    {
        # color for nushell primitives
        separator: "#f4f3ec"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7d9726"
        empty: "#36a166"
        bool: "#f4f3ec"
        int: "#f4f3ec"
        filesize: "#f4f3ec"
        duration: "#f4f3ec"
        date: "#f4f3ec"
        range: "#f4f3ec"
        float: "#f4f3ec"
        string: "#f4f3ec"
        nothing: "#f4f3ec"
        binary: "#f4f3ec"
        cellpath: "#f4f3ec"
        row_index: "#7d9726"
        record: "#f4f3ec"
        list: "#f4f3ec"
        block: "#f4f3ec"
        hints: "#6c6b5a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#5f9182"
        shape_bool: "#5b9d48"
        shape_int: "#5f9182"
        shape_float: "#5f9182"
        shape_range: "#a5980d"
        shape_internalcall: "#5b9d48"
        shape_external: "#5b9d48"
        shape_externalarg: "#7d9726"
        shape_literal: "#36a166"
        shape_operator: "#a5980d"
        shape_signature: "#7d9726"
        shape_string: "#7d9726"
        shape_string_interpolation: "#5b9d48"
        shape_datetime: "#5b9d48"
        shape_list: "#5b9d48"
        shape_table: "#36a166"
        shape_record: "#5b9d48"
        shape_block: "#36a166"
        shape_filepath: "#5b9d48"
        shape_globpattern: "#5b9d48"
        shape_variable: "#5f9182"
        shape_flag: "#36a166"
        shape_custom: "#7d9726"
        shape_nothing: "#5b9d48"
    }
}
