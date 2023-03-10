export def main [] {
    # extra desired values for the rose_pine-dawn theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#faf4ed"
    # foreground: "#575279"
    # cursor: "#575279"

    {
        # color for nushell primitives
        separator: "#26233a"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#d7827e"
        empty: "#56949f"
        bool: "#26233a"
        int: "#26233a"
        filesize: "#26233a"
        duration: "#26233a"
        date: "#26233a"
        range: "#26233a"
        float: "#26233a"
        string: "#26233a"
        nothing: "#26233a"
        binary: "#26233a"
        cellpath: "#26233a"
        row_index: "#d7827e"
        record: "#26233a"
        list: "#26233a"
        block: "#26233a"
        hints: "#9893a5"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#907aa9"
        shape_bool: "#286983"
        shape_int: "#907aa9"
        shape_float: "#907aa9"
        shape_range: "#ea9d34"
        shape_internalcall: "#286983"
        shape_external: "#286983"
        shape_externalarg: "#d7827e"
        shape_literal: "#56949f"
        shape_operator: "#ea9d34"
        shape_signature: "#d7827e"
        shape_string: "#d7827e"
        shape_string_interpolation: "#286983"
        shape_datetime: "#286983"
        shape_list: "#286983"
        shape_table: "#56949f"
        shape_record: "#286983"
        shape_block: "#56949f"
        shape_filepath: "#286983"
        shape_globpattern: "#286983"
        shape_variable: "#907aa9"
        shape_flag: "#56949f"
        shape_custom: "#d7827e"
        shape_nothing: "#286983"
    }
}
