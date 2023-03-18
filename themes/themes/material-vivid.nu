export def main [] {
    # extra desired values for the material_vivid theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#202124"
    # foreground: "#80868b"
    # cursor: "#80868b"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#00e676"
        empty: "#2196f3"
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
        row_index: "#00e676"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#44464d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#673ab7"
        shape_bool: "#00bcd4"
        shape_int: "#673ab7"
        shape_float: "#673ab7"
        shape_range: "#ffeb3b"
        shape_internalcall: "#00bcd4"
        shape_external: "#00bcd4"
        shape_externalarg: "#00e676"
        shape_literal: "#2196f3"
        shape_operator: "#ffeb3b"
        shape_signature: "#00e676"
        shape_string: "#00e676"
        shape_string_interpolation: "#00bcd4"
        shape_datetime: "#00bcd4"
        shape_list: "#00bcd4"
        shape_table: "#2196f3"
        shape_record: "#00bcd4"
        shape_block: "#2196f3"
        shape_filepath: "#00bcd4"
        shape_globpattern: "#00bcd4"
        shape_variable: "#673ab7"
        shape_flag: "#2196f3"
        shape_custom: "#00e676"
        shape_nothing: "#00bcd4"
    }
}
