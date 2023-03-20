export def main [] {
    # extra desired values for the treehouse theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#191919"
    # foreground: "#786b53"
    # cursor: "#786b53"

    {
        # color for nushell primitives
        separator: "#ffc800"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#55f238"
        empty: "#58859a"
        bool: "#ffc800"
        int: "#ffc800"
        filesize: "#ffc800"
        duration: "#ffc800"
        date: "#ffc800"
        range: "#ffc800"
        float: "#ffc800"
        string: "#ffc800"
        nothing: "#ffc800"
        binary: "#ffc800"
        cellpath: "#ffc800"
        row_index: "#55f238"
        record: "#ffc800"
        list: "#ffc800"
        block: "#ffc800"
        hints: "#433626"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#e14c5a"
        shape_bool: "#f07d14"
        shape_int: "#e14c5a"
        shape_float: "#e14c5a"
        shape_range: "#f2b732"
        shape_internalcall: "#f07d14"
        shape_external: "#b25a1e"
        shape_externalarg: "#55f238"
        shape_literal: "#58859a"
        shape_operator: "#aa820c"
        shape_signature: "#55f238"
        shape_string: "#44a900"
        shape_string_interpolation: "#f07d14"
        shape_datetime: "#f07d14"
        shape_list: "#f07d14"
        shape_table: "#85cfed"
        shape_record: "#f07d14"
        shape_block: "#85cfed"
        shape_filepath: "#b25a1e"
        shape_globpattern: "#f07d14"
        shape_variable: "#97363d"
        shape_flag: "#85cfed"
        shape_custom: "#44a900"
        shape_nothing: "#f07d14"
    }
}
