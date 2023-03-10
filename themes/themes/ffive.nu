export def main [] {
    # extra desired values for the ffive theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1d1e20"
    # foreground: "#dadadb"
    # cursor: "#dadadb"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#56d369"
        empty: "#356abf"
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
        row_index: "#56d369"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#565656"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c04fcf"
        shape_bool: "#6dd8d8"
        shape_int: "#c04fcf"
        shape_float: "#c04fcf"
        shape_range: "#ffff24"
        shape_internalcall: "#6dd8d8"
        shape_external: "#54cece"
        shape_externalarg: "#56d369"
        shape_literal: "#356abf"
        shape_operator: "#f8f800"
        shape_signature: "#56d369"
        shape_string: "#32bf46"
        shape_string_interpolation: "#6dd8d8"
        shape_datetime: "#6dd8d8"
        shape_list: "#6dd8d8"
        shape_table: "#5b89d2"
        shape_record: "#6dd8d8"
        shape_block: "#5b89d2"
        shape_filepath: "#54cece"
        shape_globpattern: "#6dd8d8"
        shape_variable: "#b035c0"
        shape_flag: "#5b89d2"
        shape_custom: "#32bf46"
        shape_nothing: "#6dd8d8"
    }
}
