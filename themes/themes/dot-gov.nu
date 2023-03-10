export def main [] {
    # extra desired values for the dot_gov theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#252b35"
    # foreground: "#eaeaea"
    # cursor: "#d9002f"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#3d9751"
        empty: "#16b1df"
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
        row_index: "#3d9751"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#181818"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#772fb0"
        shape_bool: "#8bd1ed"
        shape_int: "#772fb0"
        shape_float: "#772fb0"
        shape_range: "#f6bb33"
        shape_internalcall: "#8bd1ed"
        shape_external: "#8bd1ed"
        shape_externalarg: "#3d9751"
        shape_literal: "#16b1df"
        shape_operator: "#f6bb33"
        shape_signature: "#3d9751"
        shape_string: "#3d9751"
        shape_string_interpolation: "#8bd1ed"
        shape_datetime: "#8bd1ed"
        shape_list: "#8bd1ed"
        shape_table: "#16b1df"
        shape_record: "#8bd1ed"
        shape_block: "#16b1df"
        shape_filepath: "#8bd1ed"
        shape_globpattern: "#8bd1ed"
        shape_variable: "#772fb0"
        shape_flag: "#16b1df"
        shape_custom: "#3d9751"
        shape_nothing: "#8bd1ed"
    }
}
