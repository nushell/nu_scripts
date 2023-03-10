export def main [] {
    # extra desired values for the isotope theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#d0d0d0"
    # cursor: "#d0d0d0"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#33ff00"
        empty: "#0066ff"
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
        row_index: "#33ff00"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#808080"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#cc00ff"
        shape_bool: "#00ffff"
        shape_int: "#cc00ff"
        shape_float: "#cc00ff"
        shape_range: "#ff0099"
        shape_internalcall: "#00ffff"
        shape_external: "#00ffff"
        shape_externalarg: "#33ff00"
        shape_literal: "#0066ff"
        shape_operator: "#ff0099"
        shape_signature: "#33ff00"
        shape_string: "#33ff00"
        shape_string_interpolation: "#00ffff"
        shape_datetime: "#00ffff"
        shape_list: "#00ffff"
        shape_table: "#0066ff"
        shape_record: "#00ffff"
        shape_block: "#0066ff"
        shape_filepath: "#00ffff"
        shape_globpattern: "#00ffff"
        shape_variable: "#cc00ff"
        shape_flag: "#0066ff"
        shape_custom: "#33ff00"
        shape_nothing: "#00ffff"
    }
}
