export def main [] {
    # extra desired values for the atelier_estuary-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f4f3ec"
    # foreground: "#5f5e4e"
    # cursor: "#5f5e4e"

    {
        # color for nushell primitives
        separator: "#22221b"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7d9726"
        empty: "#36a166"
        bool: "#22221b"
        int: "#22221b"
        filesize: "#22221b"
        duration: "#22221b"
        date: "#22221b"
        range: "#22221b"
        float: "#22221b"
        string: "#22221b"
        nothing: "#22221b"
        binary: "#22221b"
        cellpath: "#22221b"
        row_index: "#7d9726"
        record: "#22221b"
        list: "#22221b"
        block: "#22221b"
        hints: "#878573"

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
