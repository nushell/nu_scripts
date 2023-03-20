export def main [] {
    # extra desired values for the material_palenight theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#292d3e"
    # foreground: "#959dcb"
    # cursor: "#959dcb"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#c3e88d"
        empty: "#82aaff"
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
        row_index: "#c3e88d"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#676e95"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c792ea"
        shape_bool: "#89ddff"
        shape_int: "#c792ea"
        shape_float: "#c792ea"
        shape_range: "#ffcb6b"
        shape_internalcall: "#89ddff"
        shape_external: "#89ddff"
        shape_externalarg: "#c3e88d"
        shape_literal: "#82aaff"
        shape_operator: "#ffcb6b"
        shape_signature: "#c3e88d"
        shape_string: "#c3e88d"
        shape_string_interpolation: "#89ddff"
        shape_datetime: "#89ddff"
        shape_list: "#89ddff"
        shape_table: "#82aaff"
        shape_record: "#89ddff"
        shape_block: "#82aaff"
        shape_filepath: "#89ddff"
        shape_globpattern: "#89ddff"
        shape_variable: "#c792ea"
        shape_flag: "#82aaff"
        shape_custom: "#c3e88d"
        shape_nothing: "#89ddff"
    }
}
