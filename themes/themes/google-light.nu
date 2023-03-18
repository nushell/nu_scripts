export def main [] {
    # extra desired values for the google_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ffffff"
    # foreground: "#373b41"
    # cursor: "#373b41"

    {
        # color for nushell primitives
        separator: "#1d1f21"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#198844"
        empty: "#3971ed"
        bool: "#1d1f21"
        int: "#1d1f21"
        filesize: "#1d1f21"
        duration: "#1d1f21"
        date: "#1d1f21"
        range: "#1d1f21"
        float: "#1d1f21"
        string: "#1d1f21"
        nothing: "#1d1f21"
        binary: "#1d1f21"
        cellpath: "#1d1f21"
        row_index: "#198844"
        record: "#1d1f21"
        list: "#1d1f21"
        block: "#1d1f21"
        hints: "#b4b7b4"

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
