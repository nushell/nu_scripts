export def main [] {
    # extra desired values for the windows_nt theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#c0c0c0"
    # cursor: "#c0c0c0"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#00ff00"
        empty: "#0000ff"
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
        row_index: "#00ff00"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#808080"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff00ff"
        shape_bool: "#00ffff"
        shape_int: "#ff00ff"
        shape_float: "#ff00ff"
        shape_range: "#ffff00"
        shape_internalcall: "#00ffff"
        shape_external: "#00ffff"
        shape_externalarg: "#00ff00"
        shape_literal: "#0000ff"
        shape_operator: "#ffff00"
        shape_signature: "#00ff00"
        shape_string: "#00ff00"
        shape_string_interpolation: "#00ffff"
        shape_datetime: "#00ffff"
        shape_list: "#00ffff"
        shape_table: "#0000ff"
        shape_record: "#00ffff"
        shape_block: "#0000ff"
        shape_filepath: "#00ffff"
        shape_globpattern: "#00ffff"
        shape_variable: "#ff00ff"
        shape_flag: "#0000ff"
        shape_custom: "#00ff00"
        shape_nothing: "#00ffff"
    }
}
