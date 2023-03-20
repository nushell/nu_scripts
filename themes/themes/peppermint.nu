export def main [] {
    # extra desired values for the peppermint theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#c7c7c7"
    # cursor: "#bbbbbb"

    {
        # color for nushell primitives
        separator: "#dedede"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a2cca1"
        empty: "#439ecf"
        bool: "#dedede"
        int: "#dedede"
        filesize: "#dedede"
        duration: "#dedede"
        date: "#dedede"
        range: "#dedede"
        float: "#dedede"
        string: "#dedede"
        nothing: "#dedede"
        binary: "#dedede"
        cellpath: "#dedede"
        row_index: "#a2cca1"
        record: "#dedede"
        list: "#dedede"
        block: "#dedede"
        hints: "#535353"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#e586e7"
        shape_bool: "#96dcda"
        shape_int: "#e586e7"
        shape_float: "#e586e7"
        shape_range: "#e1e387"
        shape_internalcall: "#96dcda"
        shape_external: "#64aaaf"
        shape_externalarg: "#a2cca1"
        shape_literal: "#439ecf"
        shape_operator: "#dab752"
        shape_signature: "#a2cca1"
        shape_string: "#89d287"
        shape_string_interpolation: "#96dcda"
        shape_datetime: "#96dcda"
        shape_list: "#96dcda"
        shape_table: "#6fbbe2"
        shape_record: "#96dcda"
        shape_block: "#6fbbe2"
        shape_filepath: "#64aaaf"
        shape_globpattern: "#96dcda"
        shape_variable: "#d961dc"
        shape_flag: "#6fbbe2"
        shape_custom: "#89d287"
        shape_nothing: "#96dcda"
    }
}
