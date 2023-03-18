export def main [] {
    # extra desired values for the atom_one-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f8f8f8"
    # foreground: "#2a2b33"
    # cursor: "#bbbbbb"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#3e953a"
        empty: "#2f5af3"
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
        row_index: "#3e953a"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#000000"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a00095"
        shape_bool: "#3e953a"
        shape_int: "#a00095"
        shape_float: "#a00095"
        shape_range: "#d2b67b"
        shape_internalcall: "#3e953a"
        shape_external: "#3e953a"
        shape_externalarg: "#3e953a"
        shape_literal: "#2f5af3"
        shape_operator: "#d2b67b"
        shape_signature: "#3e953a"
        shape_string: "#3e953a"
        shape_string_interpolation: "#3e953a"
        shape_datetime: "#3e953a"
        shape_list: "#3e953a"
        shape_table: "#2f5af3"
        shape_record: "#3e953a"
        shape_block: "#2f5af3"
        shape_filepath: "#3e953a"
        shape_globpattern: "#3e953a"
        shape_variable: "#950095"
        shape_flag: "#2f5af3"
        shape_custom: "#3e953a"
        shape_nothing: "#3e953a"
    }
}
