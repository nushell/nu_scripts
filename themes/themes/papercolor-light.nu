export def main [] {
    # extra desired values for the papercolor_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#eeeeee"
    # foreground: "#444444"
    # cursor: "#444444"

    {
        # color for nushell primitives
        separator: "#878787"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8700af"
        empty: "#d75f00"
        bool: "#878787"
        int: "#878787"
        filesize: "#878787"
        duration: "#878787"
        date: "#878787"
        range: "#878787"
        float: "#878787"
        string: "#878787"
        nothing: "#878787"
        binary: "#878787"
        cellpath: "#878787"
        row_index: "#8700af"
        record: "#878787"
        list: "#878787"
        block: "#878787"
        hints: "#5f8700"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#005faf"
        shape_bool: "#d75f00"
        shape_int: "#005faf"
        shape_float: "#005faf"
        shape_range: "#d70087"
        shape_internalcall: "#d75f00"
        shape_external: "#d75f00"
        shape_externalarg: "#8700af"
        shape_literal: "#d75f00"
        shape_operator: "#d70087"
        shape_signature: "#8700af"
        shape_string: "#8700af"
        shape_string_interpolation: "#d75f00"
        shape_datetime: "#d75f00"
        shape_list: "#d75f00"
        shape_table: "#d75f00"
        shape_record: "#d75f00"
        shape_block: "#d75f00"
        shape_filepath: "#d75f00"
        shape_globpattern: "#d75f00"
        shape_variable: "#005faf"
        shape_flag: "#d75f00"
        shape_custom: "#8700af"
        shape_nothing: "#d75f00"
    }
}
