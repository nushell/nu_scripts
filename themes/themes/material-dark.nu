export def main [] {
    # extra desired values for the material_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#222221"
    # foreground: "#e4e4e4"
    # cursor: "#16aec9"

    {
        # color for nushell primitives
        separator: "#d8d8d8"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7aba39"
        empty: "#134eb2"
        bool: "#d8d8d8"
        int: "#d8d8d8"
        filesize: "#d8d8d8"
        duration: "#d8d8d8"
        date: "#d8d8d8"
        range: "#d8d8d8"
        float: "#d8d8d8"
        string: "#d8d8d8"
        nothing: "#d8d8d8"
        binary: "#d8d8d8"
        cellpath: "#d8d8d8"
        row_index: "#7aba39"
        record: "#d8d8d8"
        list: "#d8d8d8"
        block: "#d8d8d8"
        hints: "#424242"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a94dbb"
        shape_bool: "#26bad1"
        shape_int: "#a94dbb"
        shape_float: "#a94dbb"
        shape_range: "#fee92e"
        shape_internalcall: "#26bad1"
        shape_external: "#0e707c"
        shape_externalarg: "#7aba39"
        shape_literal: "#134eb2"
        shape_operator: "#f5971d"
        shape_signature: "#7aba39"
        shape_string: "#457b23"
        shape_string_interpolation: "#26bad1"
        shape_datetime: "#26bad1"
        shape_list: "#26bad1"
        shape_table: "#53a4f3"
        shape_record: "#26bad1"
        shape_block: "#53a4f3"
        shape_filepath: "#0e707c"
        shape_globpattern: "#26bad1"
        shape_variable: "#550087"
        shape_flag: "#53a4f3"
        shape_custom: "#457b23"
        shape_nothing: "#26bad1"
    }
}
