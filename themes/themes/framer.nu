export def main [] {
    # extra desired values for the framer theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#181818"
    # foreground: "#d0d0d0"
    # cursor: "#d0d0d0"

    {
        # color for nushell primitives
        separator: "#eeeeee"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#32ccdc"
        empty: "#20bcfc"
        bool: "#eeeeee"
        int: "#eeeeee"
        filesize: "#eeeeee"
        duration: "#eeeeee"
        date: "#eeeeee"
        range: "#eeeeee"
        float: "#eeeeee"
        string: "#eeeeee"
        nothing: "#eeeeee"
        binary: "#eeeeee"
        cellpath: "#eeeeee"
        row_index: "#32ccdc"
        record: "#eeeeee"
        list: "#eeeeee"
        block: "#eeeeee"
        hints: "#747474"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ba8cfc"
        shape_bool: "#acddfd"
        shape_int: "#ba8cfc"
        shape_float: "#ba8cfc"
        shape_range: "#fecb6e"
        shape_internalcall: "#acddfd"
        shape_external: "#acddfd"
        shape_externalarg: "#32ccdc"
        shape_literal: "#20bcfc"
        shape_operator: "#fecb6e"
        shape_signature: "#32ccdc"
        shape_string: "#32ccdc"
        shape_string_interpolation: "#acddfd"
        shape_datetime: "#acddfd"
        shape_list: "#acddfd"
        shape_table: "#20bcfc"
        shape_record: "#acddfd"
        shape_block: "#20bcfc"
        shape_filepath: "#acddfd"
        shape_globpattern: "#acddfd"
        shape_variable: "#ba8cfc"
        shape_flag: "#20bcfc"
        shape_custom: "#32ccdc"
        shape_nothing: "#acddfd"
    }
}
