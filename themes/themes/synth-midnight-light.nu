export def main [] {
    # extra desired values for the synth_midnight-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#dddfe0"
    # foreground: "#28292a"
    # cursor: "#28292a"

    {
        # color for nushell primitives
        separator: "#050608"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#06ea61"
        empty: "#03aeff"
        bool: "#050608"
        int: "#050608"
        filesize: "#050608"
        duration: "#050608"
        date: "#050608"
        range: "#050608"
        float: "#050608"
        string: "#050608"
        nothing: "#050608"
        binary: "#050608"
        cellpath: "#050608"
        row_index: "#06ea61"
        record: "#050608"
        list: "#050608"
        block: "#050608"
        hints: "#a3a5a6"

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
