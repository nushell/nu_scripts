export def main [] {
    # extra desired values for the e_n-c-o-m theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#00a595"
    # cursor: "#bbbbbb"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#00ee00"
        empty: "#0081ff"
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
        row_index: "#00ee00"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#545454"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff00ff"
        shape_bool: "#00cdcd"
        shape_int: "#ff00ff"
        shape_float: "#ff00ff"
        shape_range: "#ffff00"
        shape_internalcall: "#00cdcd"
        shape_external: "#008b8b"
        shape_externalarg: "#00ee00"
        shape_literal: "#0081ff"
        shape_operator: "#ffcf00"
        shape_signature: "#00ee00"
        shape_string: "#008b00"
        shape_string_interpolation: "#00cdcd"
        shape_datetime: "#00cdcd"
        shape_list: "#00cdcd"
        shape_table: "#0000ff"
        shape_record: "#00cdcd"
        shape_block: "#0000ff"
        shape_filepath: "#008b8b"
        shape_globpattern: "#00cdcd"
        shape_variable: "#bc00ca"
        shape_flag: "#0000ff"
        shape_custom: "#008b00"
        shape_nothing: "#00cdcd"
    }
}
