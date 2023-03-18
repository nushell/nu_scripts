export def main [] {
    # extra desired values for the renault_style-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#3a3a3a"
    # foreground: "#e9cb7b"
    # cursor: "#7f7f7f"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#83d082"
        empty: "#46657d"
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
        row_index: "#83d082"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#323232"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ffffff"
        shape_bool: "#a4d4f8"
        shape_int: "#ffffff"
        shape_float: "#ffffff"
        shape_range: "#ffff7b"
        shape_internalcall: "#a4d4f8"
        shape_external: "#87c1f1"
        shape_externalarg: "#83d082"
        shape_literal: "#46657d"
        shape_operator: "#ffd249"
        shape_signature: "#83d082"
        shape_string: "#509f50"
        shape_string_interpolation: "#a4d4f8"
        shape_datetime: "#a4d4f8"
        shape_list: "#a4d4f8"
        shape_table: "#9fcef0"
        shape_record: "#a4d4f8"
        shape_block: "#9fcef0"
        shape_filepath: "#87c1f1"
        shape_globpattern: "#a4d4f8"
        shape_variable: "#cfcfff"
        shape_flag: "#9fcef0"
        shape_custom: "#509f50"
        shape_nothing: "#a4d4f8"
    }
}
