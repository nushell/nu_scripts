export def main [] {
    # extra desired values for the synth_midnight-dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#050608"
    # foreground: "#c1c3c4"
    # cursor: "#c1c3c4"

    {
        # color for nushell primitives
        separator: "#dddfe0"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#06ea61"
        empty: "#03aeff"
        bool: "#dddfe0"
        int: "#dddfe0"
        filesize: "#dddfe0"
        duration: "#dddfe0"
        date: "#dddfe0"
        range: "#dddfe0"
        float: "#dddfe0"
        string: "#dddfe0"
        nothing: "#dddfe0"
        binary: "#dddfe0"
        cellpath: "#dddfe0"
        row_index: "#06ea61"
        record: "#dddfe0"
        list: "#dddfe0"
        block: "#dddfe0"
        hints: "#474849"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ea5ce2"
        shape_bool: "#42fff9"
        shape_int: "#ea5ce2"
        shape_float: "#ea5ce2"
        shape_range: "#c9d364"
        shape_internalcall: "#42fff9"
        shape_external: "#42fff9"
        shape_externalarg: "#06ea61"
        shape_literal: "#03aeff"
        shape_operator: "#c9d364"
        shape_signature: "#06ea61"
        shape_string: "#06ea61"
        shape_string_interpolation: "#42fff9"
        shape_datetime: "#42fff9"
        shape_list: "#42fff9"
        shape_table: "#03aeff"
        shape_record: "#42fff9"
        shape_block: "#03aeff"
        shape_filepath: "#42fff9"
        shape_globpattern: "#42fff9"
        shape_variable: "#ea5ce2"
        shape_flag: "#03aeff"
        shape_custom: "#06ea61"
        shape_nothing: "#42fff9"
    }
}
