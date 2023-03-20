export def main [] {
    # extra desired values for the grayscale_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#101010"
    # foreground: "#b9b9b9"
    # cursor: "#b9b9b9"

    {
        # color for nushell primitives
        separator: "#f7f7f7"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8e8e8e"
        empty: "#686868"
        bool: "#f7f7f7"
        int: "#f7f7f7"
        filesize: "#f7f7f7"
        duration: "#f7f7f7"
        date: "#f7f7f7"
        range: "#f7f7f7"
        float: "#f7f7f7"
        string: "#f7f7f7"
        nothing: "#f7f7f7"
        binary: "#f7f7f7"
        cellpath: "#f7f7f7"
        row_index: "#8e8e8e"
        record: "#f7f7f7"
        list: "#f7f7f7"
        block: "#f7f7f7"
        hints: "#525252"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#747474"
        shape_bool: "#868686"
        shape_int: "#747474"
        shape_float: "#747474"
        shape_range: "#a0a0a0"
        shape_internalcall: "#868686"
        shape_external: "#868686"
        shape_externalarg: "#8e8e8e"
        shape_literal: "#686868"
        shape_operator: "#a0a0a0"
        shape_signature: "#8e8e8e"
        shape_string: "#8e8e8e"
        shape_string_interpolation: "#868686"
        shape_datetime: "#868686"
        shape_list: "#868686"
        shape_table: "#686868"
        shape_record: "#868686"
        shape_block: "#686868"
        shape_filepath: "#868686"
        shape_globpattern: "#868686"
        shape_variable: "#747474"
        shape_flag: "#686868"
        shape_custom: "#8e8e8e"
        shape_nothing: "#868686"
    }
}
