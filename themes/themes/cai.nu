export def main [] {
    # extra desired values for the cai theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#09111a"
    # foreground: "#d9e6f2"
    # cursor: "#d9e6f2"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a3e98d"
        empty: "#274dca"
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
        row_index: "#a3e98d"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#808080"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d48de9"
        shape_bool: "#8de9d4"
        shape_int: "#d48de9"
        shape_float: "#d48de9"
        shape_range: "#e9d48d"
        shape_internalcall: "#8de9d4"
        shape_external: "#27caa4"
        shape_externalarg: "#a3e98d"
        shape_literal: "#274dca"
        shape_operator: "#caa427"
        shape_signature: "#a3e98d"
        shape_string: "#4dca27"
        shape_string_interpolation: "#8de9d4"
        shape_datetime: "#8de9d4"
        shape_list: "#8de9d4"
        shape_table: "#8da3e9"
        shape_record: "#8de9d4"
        shape_block: "#8da3e9"
        shape_filepath: "#27caa4"
        shape_globpattern: "#8de9d4"
        shape_variable: "#a427ca"
        shape_flag: "#8da3e9"
        shape_custom: "#4dca27"
        shape_nothing: "#8de9d4"
    }
}
