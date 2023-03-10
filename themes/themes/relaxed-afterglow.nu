export def main [] {
    # extra desired values for the relaxed_afterglow theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#353a44"
    # foreground: "#d9d9d9"
    # cursor: "#d9d9d9"

    {
        # color for nushell primitives
        separator: "#f7f7f7"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#a0ac77"
        empty: "#6a8799"
        bool: "#f7f7f7"
        int: "#f7f7f7"
        filesize: "#f7f7f7"
        duration: "#f7f7f7"
        date: "#f7f7f7"
        range: "#f7f7f7"
        float: "#f7f7f7"
        string: "#f7f7f7"
        nothing: "#f7f7f7"
        binary: "#f7f7f7"
        cellpath: "#f7f7f7"
        row_index: "#a0ac77"
        record: "#f7f7f7"
        list: "#f7f7f7"
        block: "#f7f7f7"
        hints: "#636363"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b06698"
        shape_bool: "#acbbd0"
        shape_int: "#b06698"
        shape_float: "#b06698"
        shape_range: "#ebc17a"
        shape_internalcall: "#acbbd0"
        shape_external: "#c9dfff"
        shape_externalarg: "#a0ac77"
        shape_literal: "#6a8799"
        shape_operator: "#ebc17a"
        shape_signature: "#a0ac77"
        shape_string: "#909d63"
        shape_string_interpolation: "#acbbd0"
        shape_datetime: "#acbbd0"
        shape_list: "#acbbd0"
        shape_table: "#7eaac7"
        shape_record: "#acbbd0"
        shape_block: "#7eaac7"
        shape_filepath: "#c9dfff"
        shape_globpattern: "#acbbd0"
        shape_variable: "#b06698"
        shape_flag: "#7eaac7"
        shape_custom: "#909d63"
        shape_nothing: "#acbbd0"
    }
}
