export def main [] {
    # extra desired values for the ir_black theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#b5b3aa"
    # cursor: "#b5b3aa"

    {
        # color for nushell primitives
        separator: "#fdfbee"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a8ff60"
        empty: "#96cbfe"
        bool: "#fdfbee"
        int: "#fdfbee"
        filesize: "#fdfbee"
        duration: "#fdfbee"
        date: "#fdfbee"
        range: "#fdfbee"
        float: "#fdfbee"
        string: "#fdfbee"
        nothing: "#fdfbee"
        binary: "#fdfbee"
        cellpath: "#fdfbee"
        row_index: "#a8ff60"
        record: "#fdfbee"
        list: "#fdfbee"
        block: "#fdfbee"
        hints: "#6c6c66"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff73fd"
        shape_bool: "#c6c5fe"
        shape_int: "#ff73fd"
        shape_float: "#ff73fd"
        shape_range: "#ffffb6"
        shape_internalcall: "#c6c5fe"
        shape_external: "#c6c5fe"
        shape_externalarg: "#a8ff60"
        shape_literal: "#96cbfe"
        shape_operator: "#ffffb6"
        shape_signature: "#a8ff60"
        shape_string: "#a8ff60"
        shape_string_interpolation: "#c6c5fe"
        shape_datetime: "#c6c5fe"
        shape_list: "#c6c5fe"
        shape_table: "#96cbfe"
        shape_record: "#c6c5fe"
        shape_block: "#96cbfe"
        shape_filepath: "#c6c5fe"
        shape_globpattern: "#c6c5fe"
        shape_variable: "#ff73fd"
        shape_flag: "#96cbfe"
        shape_custom: "#a8ff60"
        shape_nothing: "#c6c5fe"
    }
}
