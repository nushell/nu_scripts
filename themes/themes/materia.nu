export def main [] {
    # extra desired values for the materia theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#263238"
    # foreground: "#cdd3de"
    # cursor: "#cdd3de"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8bd649"
        empty: "#89ddff"
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
        row_index: "#8bd649"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#707880"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#82aaff"
        shape_bool: "#80cbc4"
        shape_int: "#82aaff"
        shape_float: "#82aaff"
        shape_range: "#ffcc00"
        shape_internalcall: "#80cbc4"
        shape_external: "#80cbc4"
        shape_externalarg: "#8bd649"
        shape_literal: "#89ddff"
        shape_operator: "#ffcc00"
        shape_signature: "#8bd649"
        shape_string: "#8bd649"
        shape_string_interpolation: "#80cbc4"
        shape_datetime: "#80cbc4"
        shape_list: "#80cbc4"
        shape_table: "#89ddff"
        shape_record: "#80cbc4"
        shape_block: "#89ddff"
        shape_filepath: "#80cbc4"
        shape_globpattern: "#80cbc4"
        shape_variable: "#82aaff"
        shape_flag: "#89ddff"
        shape_custom: "#8bd649"
        shape_nothing: "#80cbc4"
    }
}
