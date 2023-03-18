export def main [] {
    # extra desired values for the vibrant_ink theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#ffffff"
    # cursor: "#ffffff"

    {
        # color for nushell primitives
        separator: "#e5e5e5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#00ff00"
        empty: "#44b4cc"
        bool: "#e5e5e5"
        int: "#e5e5e5"
        filesize: "#e5e5e5"
        duration: "#e5e5e5"
        date: "#e5e5e5"
        range: "#e5e5e5"
        float: "#e5e5e5"
        string: "#e5e5e5"
        nothing: "#e5e5e5"
        binary: "#e5e5e5"
        cellpath: "#e5e5e5"
        row_index: "#00ff00"
        record: "#e5e5e5"
        list: "#e5e5e5"
        block: "#e5e5e5"
        hints: "#555555"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff00ff"
        shape_bool: "#00ffff"
        shape_int: "#ff00ff"
        shape_float: "#ff00ff"
        shape_range: "#ffff00"
        shape_internalcall: "#00ffff"
        shape_external: "#44b4cc"
        shape_externalarg: "#00ff00"
        shape_literal: "#44b4cc"
        shape_operator: "#ffcc00"
        shape_signature: "#00ff00"
        shape_string: "#ccff04"
        shape_string_interpolation: "#00ffff"
        shape_datetime: "#00ffff"
        shape_list: "#00ffff"
        shape_table: "#0000ff"
        shape_record: "#00ffff"
        shape_block: "#0000ff"
        shape_filepath: "#44b4cc"
        shape_globpattern: "#00ffff"
        shape_variable: "#9933cc"
        shape_flag: "#0000ff"
        shape_custom: "#ccff04"
        shape_nothing: "#00ffff"
    }
}
