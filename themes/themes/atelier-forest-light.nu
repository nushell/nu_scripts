export def main [] {
    # extra desired values for the atelier_forest-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f1efee"
    # foreground: "#68615e"
    # cursor: "#68615e"

    {
        # color for nushell primitives
        separator: "#1b1918"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7b9726"
        empty: "#407ee7"
        bool: "#1b1918"
        int: "#1b1918"
        filesize: "#1b1918"
        duration: "#1b1918"
        date: "#1b1918"
        range: "#1b1918"
        float: "#1b1918"
        string: "#1b1918"
        nothing: "#1b1918"
        binary: "#1b1918"
        cellpath: "#1b1918"
        row_index: "#7b9726"
        record: "#1b1918"
        list: "#1b1918"
        block: "#1b1918"
        hints: "#9c9491"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#6666ea"
        shape_bool: "#3d97b8"
        shape_int: "#6666ea"
        shape_float: "#6666ea"
        shape_range: "#c38418"
        shape_internalcall: "#3d97b8"
        shape_external: "#3d97b8"
        shape_externalarg: "#7b9726"
        shape_literal: "#407ee7"
        shape_operator: "#c38418"
        shape_signature: "#7b9726"
        shape_string: "#7b9726"
        shape_string_interpolation: "#3d97b8"
        shape_datetime: "#3d97b8"
        shape_list: "#3d97b8"
        shape_table: "#407ee7"
        shape_record: "#3d97b8"
        shape_block: "#407ee7"
        shape_filepath: "#3d97b8"
        shape_globpattern: "#3d97b8"
        shape_variable: "#6666ea"
        shape_flag: "#407ee7"
        shape_custom: "#7b9726"
        shape_nothing: "#3d97b8"
    }
}
