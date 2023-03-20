export def main [] {
    # extra desired values for the grayscale_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f7f7f7"
    # foreground: "#464646"
    # cursor: "#464646"

    {
        # color for nushell primitives
        separator: "#101010"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8e8e8e"
        empty: "#686868"
        bool: "#101010"
        int: "#101010"
        filesize: "#101010"
        duration: "#101010"
        date: "#101010"
        range: "#101010"
        float: "#101010"
        string: "#101010"
        nothing: "#101010"
        binary: "#101010"
        cellpath: "#101010"
        row_index: "#8e8e8e"
        record: "#101010"
        list: "#101010"
        block: "#101010"
        hints: "#ababab"

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
