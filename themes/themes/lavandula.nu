export def main [] {
    # extra desired values for the lavandula theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#050014"
    # foreground: "#736e7d"
    # cursor: "#736e7d"

    {
        # color for nushell primitives
        separator: "#8c91fa"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#52e0c4"
        empty: "#4f4a7f"
        bool: "#8c91fa"
        int: "#8c91fa"
        filesize: "#8c91fa"
        duration: "#8c91fa"
        date: "#8c91fa"
        range: "#8c91fa"
        float: "#8c91fa"
        string: "#8c91fa"
        nothing: "#8c91fa"
        binary: "#8c91fa"
        cellpath: "#8c91fa"
        row_index: "#52e0c4"
        record: "#8c91fa"
        list: "#8c91fa"
        block: "#8c91fa"
        hints: "#372d46"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a776e0"
        shape_bool: "#9ad4e0"
        shape_int: "#a776e0"
        shape_float: "#a776e0"
        shape_range: "#e0c386"
        shape_internalcall: "#9ad4e0"
        shape_external: "#58777f"
        shape_externalarg: "#52e0c4"
        shape_literal: "#4f4a7f"
        shape_operator: "#7f6f49"
        shape_signature: "#52e0c4"
        shape_string: "#337e6f"
        shape_string_interpolation: "#9ad4e0"
        shape_datetime: "#9ad4e0"
        shape_list: "#9ad4e0"
        shape_table: "#8e87e0"
        shape_record: "#9ad4e0"
        shape_block: "#8e87e0"
        shape_filepath: "#58777f"
        shape_globpattern: "#9ad4e0"
        shape_variable: "#5a3f7f"
        shape_flag: "#8e87e0"
        shape_custom: "#337e6f"
        shape_nothing: "#9ad4e0"
    }
}
