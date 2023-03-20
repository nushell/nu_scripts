export def main [] {
    # extra desired values for the unikitty_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ffffff"
    # foreground: "#6c696e"
    # cursor: "#6c696e"

    {
        # color for nushell primitives
        separator: "#322d34"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#17ad98"
        empty: "#775dff"
        bool: "#322d34"
        int: "#322d34"
        filesize: "#322d34"
        duration: "#322d34"
        date: "#322d34"
        range: "#322d34"
        float: "#322d34"
        string: "#322d34"
        nothing: "#322d34"
        binary: "#322d34"
        cellpath: "#322d34"
        row_index: "#17ad98"
        record: "#322d34"
        list: "#322d34"
        block: "#322d34"
        hints: "#a7a5a8"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#aa17e6"
        shape_bool: "#149bda"
        shape_int: "#aa17e6"
        shape_float: "#aa17e6"
        shape_range: "#dc8a0e"
        shape_internalcall: "#149bda"
        shape_external: "#149bda"
        shape_externalarg: "#17ad98"
        shape_literal: "#775dff"
        shape_operator: "#dc8a0e"
        shape_signature: "#17ad98"
        shape_string: "#17ad98"
        shape_string_interpolation: "#149bda"
        shape_datetime: "#149bda"
        shape_list: "#149bda"
        shape_table: "#775dff"
        shape_record: "#149bda"
        shape_block: "#775dff"
        shape_filepath: "#149bda"
        shape_globpattern: "#149bda"
        shape_variable: "#aa17e6"
        shape_flag: "#775dff"
        shape_custom: "#17ad98"
        shape_nothing: "#149bda"
    }
}
