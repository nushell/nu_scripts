export def main [] {
    # extra desired values for the arthur theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1c1c1c"
    # foreground: "#ddeedd"
    # cursor: "#ddeedd"

    {
        # color for nushell primitives
        separator: "#ddccbb"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#88aa22"
        empty: "#6495ed"
        bool: "#ddccbb"
        int: "#ddccbb"
        filesize: "#ddccbb"
        duration: "#ddccbb"
        date: "#ddccbb"
        range: "#ddccbb"
        float: "#ddccbb"
        string: "#ddccbb"
        nothing: "#ddccbb"
        binary: "#ddccbb"
        cellpath: "#ddccbb"
        row_index: "#88aa22"
        record: "#ddccbb"
        list: "#ddccbb"
        block: "#ddccbb"
        hints: "#554444"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#996600"
        shape_bool: "#b0c4de"
        shape_int: "#996600"
        shape_float: "#996600"
        shape_range: "#ffa75d"
        shape_internalcall: "#b0c4de"
        shape_external: "#b0c4de"
        shape_externalarg: "#88aa22"
        shape_literal: "#6495ed"
        shape_operator: "#e8ae5b"
        shape_signature: "#88aa22"
        shape_string: "#86af80"
        shape_string_interpolation: "#b0c4de"
        shape_datetime: "#b0c4de"
        shape_list: "#b0c4de"
        shape_table: "#87ceeb"
        shape_record: "#b0c4de"
        shape_block: "#87ceeb"
        shape_filepath: "#b0c4de"
        shape_globpattern: "#b0c4de"
        shape_variable: "#deb887"
        shape_flag: "#87ceeb"
        shape_custom: "#86af80"
        shape_nothing: "#b0c4de"
    }
}
