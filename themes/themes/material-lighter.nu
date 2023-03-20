export def main [] {
    # extra desired values for the material_lighter theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#fafafa"
    # foreground: "#80cbc4"
    # cursor: "#80cbc4"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#91b859"
        empty: "#6182b8"
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
        row_index: "#91b859"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#ccd7da"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#7c4dff"
        shape_bool: "#39adb5"
        shape_int: "#7c4dff"
        shape_float: "#7c4dff"
        shape_range: "#ffb62c"
        shape_internalcall: "#39adb5"
        shape_external: "#39adb5"
        shape_externalarg: "#91b859"
        shape_literal: "#6182b8"
        shape_operator: "#ffb62c"
        shape_signature: "#91b859"
        shape_string: "#91b859"
        shape_string_interpolation: "#39adb5"
        shape_datetime: "#39adb5"
        shape_list: "#39adb5"
        shape_table: "#6182b8"
        shape_record: "#39adb5"
        shape_block: "#6182b8"
        shape_filepath: "#39adb5"
        shape_globpattern: "#39adb5"
        shape_variable: "#7c4dff"
        shape_flag: "#6182b8"
        shape_custom: "#91b859"
        shape_nothing: "#39adb5"
    }
}
