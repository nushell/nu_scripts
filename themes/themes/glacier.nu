export def main [] {
    # extra desired values for the glacier theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0c1115"
    # foreground: "#ffffff"
    # cursor: "#6c6c6c"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#49e998"
        empty: "#1f5872"
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
        row_index: "#49e998"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#404a55"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ea4727"
        shape_bool: "#a0b6d3"
        shape_int: "#ea4727"
        shape_float: "#ea4727"
        shape_range: "#fddf6e"
        shape_internalcall: "#a0b6d3"
        shape_external: "#778397"
        shape_externalarg: "#49e998"
        shape_literal: "#1f5872"
        shape_operator: "#fb9435"
        shape_signature: "#49e998"
        shape_string: "#35a770"
        shape_string_interpolation: "#a0b6d3"
        shape_datetime: "#a0b6d3"
        shape_list: "#a0b6d3"
        shape_table: "#2a8bc1"
        shape_record: "#a0b6d3"
        shape_block: "#2a8bc1"
        shape_filepath: "#778397"
        shape_globpattern: "#a0b6d3"
        shape_variable: "#bd2523"
        shape_flag: "#2a8bc1"
        shape_custom: "#35a770"
        shape_nothing: "#a0b6d3"
    }
}
