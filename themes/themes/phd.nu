export def main [] {
    # extra desired values for the phd theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#061229"
    # foreground: "#b8bbc2"
    # cursor: "#b8bbc2"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#99bf52"
        empty: "#5299bf"
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
        row_index: "#99bf52"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#717885"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9989cc"
        shape_bool: "#72b9bf"
        shape_int: "#9989cc"
        shape_float: "#9989cc"
        shape_range: "#fbd461"
        shape_internalcall: "#72b9bf"
        shape_external: "#72b9bf"
        shape_externalarg: "#99bf52"
        shape_literal: "#5299bf"
        shape_operator: "#fbd461"
        shape_signature: "#99bf52"
        shape_string: "#99bf52"
        shape_string_interpolation: "#72b9bf"
        shape_datetime: "#72b9bf"
        shape_list: "#72b9bf"
        shape_table: "#5299bf"
        shape_record: "#72b9bf"
        shape_block: "#5299bf"
        shape_filepath: "#72b9bf"
        shape_globpattern: "#72b9bf"
        shape_variable: "#9989cc"
        shape_flag: "#5299bf"
        shape_custom: "#99bf52"
        shape_nothing: "#72b9bf"
    }
}
