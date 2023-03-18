export def main [] {
    # extra desired values for the atelier_forest theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1b1918"
    # foreground: "#a8a19f"
    # cursor: "#a8a19f"

    {
        # color for nushell primitives
        separator: "#f1efee"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7b9726"
        empty: "#407ee7"
        bool: "#f1efee"
        int: "#f1efee"
        filesize: "#f1efee"
        duration: "#f1efee"
        date: "#f1efee"
        range: "#f1efee"
        float: "#f1efee"
        string: "#f1efee"
        nothing: "#f1efee"
        binary: "#f1efee"
        cellpath: "#f1efee"
        row_index: "#7b9726"
        record: "#f1efee"
        list: "#f1efee"
        block: "#f1efee"
        hints: "#766e6b"

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
