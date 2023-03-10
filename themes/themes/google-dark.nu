export def main [] {
    # extra desired values for the google_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1d1f21"
    # foreground: "#c5c8c6"
    # cursor: "#c5c8c6"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#198844"
        empty: "#3971ed"
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
        row_index: "#198844"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#969896"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a36ac7"
        shape_bool: "#3971ed"
        shape_int: "#a36ac7"
        shape_float: "#a36ac7"
        shape_range: "#fba922"
        shape_internalcall: "#3971ed"
        shape_external: "#3971ed"
        shape_externalarg: "#198844"
        shape_literal: "#3971ed"
        shape_operator: "#fba922"
        shape_signature: "#198844"
        shape_string: "#198844"
        shape_string_interpolation: "#3971ed"
        shape_datetime: "#3971ed"
        shape_list: "#3971ed"
        shape_table: "#3971ed"
        shape_record: "#3971ed"
        shape_block: "#3971ed"
        shape_filepath: "#3971ed"
        shape_globpattern: "#3971ed"
        shape_variable: "#a36ac7"
        shape_flag: "#3971ed"
        shape_custom: "#198844"
        shape_nothing: "#3971ed"
    }
}
