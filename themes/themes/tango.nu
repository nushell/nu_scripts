export def main [] {
    # extra desired values for the tango theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2e3436"
    # foreground: "#d3d7cf"
    # cursor: "#d3d7cf"

    {
        # color for nushell primitives
        separator: "#eeeeec"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#4e9a06"
        empty: "#3465a4"
        bool: "#eeeeec"
        int: "#eeeeec"
        filesize: "#eeeeec"
        duration: "#eeeeec"
        date: "#eeeeec"
        range: "#eeeeec"
        float: "#eeeeec"
        string: "#eeeeec"
        nothing: "#eeeeec"
        binary: "#eeeeec"
        cellpath: "#eeeeec"
        row_index: "#4e9a06"
        record: "#eeeeec"
        list: "#eeeeec"
        block: "#eeeeec"
        hints: "#555753"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#75507b"
        shape_bool: "#06989a"
        shape_int: "#75507b"
        shape_float: "#75507b"
        shape_range: "#c4a000"
        shape_internalcall: "#06989a"
        shape_external: "#06989a"
        shape_externalarg: "#4e9a06"
        shape_literal: "#3465a4"
        shape_operator: "#c4a000"
        shape_signature: "#4e9a06"
        shape_string: "#4e9a06"
        shape_string_interpolation: "#06989a"
        shape_datetime: "#06989a"
        shape_list: "#06989a"
        shape_table: "#3465a4"
        shape_record: "#06989a"
        shape_block: "#3465a4"
        shape_filepath: "#06989a"
        shape_globpattern: "#06989a"
        shape_variable: "#75507b"
        shape_flag: "#3465a4"
        shape_custom: "#4e9a06"
        shape_nothing: "#06989a"
    }
}
