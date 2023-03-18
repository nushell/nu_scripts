export def main [] {
    # extra desired values for the highway theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#222225"
    # foreground: "#ededed"
    # cursor: "#ededed"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b1d130"
        empty: "#006bb3"
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
        row_index: "#b1d130"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#5d504a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#de0071"
        shape_bool: "#5d504a"
        shape_int: "#de0071"
        shape_float: "#de0071"
        shape_range: "#fff120"
        shape_internalcall: "#5d504a"
        shape_external: "#384564"
        shape_externalarg: "#b1d130"
        shape_literal: "#006bb3"
        shape_operator: "#ffcb3e"
        shape_signature: "#b1d130"
        shape_string: "#138034"
        shape_string_interpolation: "#5d504a"
        shape_datetime: "#5d504a"
        shape_list: "#5d504a"
        shape_table: "#4fc2fd"
        shape_record: "#5d504a"
        shape_block: "#4fc2fd"
        shape_filepath: "#384564"
        shape_globpattern: "#5d504a"
        shape_variable: "#6b2775"
        shape_flag: "#4fc2fd"
        shape_custom: "#138034"
        shape_nothing: "#5d504a"
    }
}
