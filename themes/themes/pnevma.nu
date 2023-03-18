export def main [] {
    # extra desired values for the pnevma theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1c1c1c"
    # foreground: "#d0d0d0"
    # cursor: "#d0d0d0"

    {
        # color for nushell primitives
        separator: "#efefef"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#afbea2"
        empty: "#7fa5bd"
        bool: "#efefef"
        int: "#efefef"
        filesize: "#efefef"
        duration: "#efefef"
        date: "#efefef"
        range: "#efefef"
        float: "#efefef"
        string: "#efefef"
        nothing: "#efefef"
        binary: "#efefef"
        cellpath: "#efefef"
        row_index: "#afbea2"
        record: "#efefef"
        list: "#efefef"
        block: "#efefef"
        hints: "#4a4845"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d7beda"
        shape_bool: "#b1e7dd"
        shape_int: "#d7beda"
        shape_float: "#d7beda"
        shape_range: "#e4c9af"
        shape_internalcall: "#b1e7dd"
        shape_external: "#8adbb4"
        shape_externalarg: "#afbea2"
        shape_literal: "#7fa5bd"
        shape_operator: "#d7af87"
        shape_signature: "#afbea2"
        shape_string: "#90a57d"
        shape_string_interpolation: "#b1e7dd"
        shape_datetime: "#b1e7dd"
        shape_list: "#b1e7dd"
        shape_table: "#a1bdce"
        shape_record: "#b1e7dd"
        shape_block: "#a1bdce"
        shape_filepath: "#8adbb4"
        shape_globpattern: "#b1e7dd"
        shape_variable: "#c79ec4"
        shape_flag: "#a1bdce"
        shape_custom: "#90a57d"
        shape_nothing: "#b1e7dd"
    }
}
