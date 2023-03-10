export def main [] {
    # extra desired values for the github theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ffffff"
    # foreground: "#333333"
    # cursor: "#333333"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#183691"
        empty: "#795da3"
        bool: "#ffffff"
        int: "#ffffff"
        filesize: "#ffffff"
        duration: "#ffffff"
        date: "#ffffff"
        range: "#ffffff"
        float: "#ffffff"
        string: "#ffffff"
        nothing: "#ffffff"
        binary: "#ffffff"
        cellpath: "#ffffff"
        row_index: "#183691"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#969896"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a71d5d"
        shape_bool: "#183691"
        shape_int: "#a71d5d"
        shape_float: "#a71d5d"
        shape_range: "#795da3"
        shape_internalcall: "#183691"
        shape_external: "#183691"
        shape_externalarg: "#183691"
        shape_literal: "#795da3"
        shape_operator: "#795da3"
        shape_signature: "#183691"
        shape_string: "#183691"
        shape_string_interpolation: "#183691"
        shape_datetime: "#183691"
        shape_list: "#183691"
        shape_table: "#795da3"
        shape_record: "#183691"
        shape_block: "#795da3"
        shape_filepath: "#183691"
        shape_globpattern: "#183691"
        shape_variable: "#a71d5d"
        shape_flag: "#795da3"
        shape_custom: "#183691"
        shape_nothing: "#183691"
    }
}
