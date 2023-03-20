export def main [] {
    # extra desired values for the source_code-x theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1f1f24"
    # foreground: "#000000"
    # cursor: "#7f7f7f"

    {
        # color for nushell primitives
        separator: "#91a0b1"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#aef37c"
        empty: "#9586f4"
        bool: "#91a0b1"
        int: "#91a0b1"
        filesize: "#91a0b1"
        duration: "#91a0b1"
        date: "#91a0b1"
        range: "#91a0b1"
        float: "#91a0b1"
        string: "#91a0b1"
        nothing: "#91a0b1"
        binary: "#91a0b1"
        cellpath: "#91a0b1"
        row_index: "#aef37c"
        record: "#91a0b1"
        list: "#91a0b1"
        block: "#91a0b1"
        hints: "#91a0b1"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#fb5ea3"
        shape_bool: "#83d2c0"
        shape_int: "#fb5ea3"
        shape_float: "#fb5ea3"
        shape_range: "#fc8e3e"
        shape_internalcall: "#83d2c0"
        shape_external: "#79c8b6"
        shape_externalarg: "#aef37c"
        shape_literal: "#9586f4"
        shape_operator: "#fc8e3e"
        shape_signature: "#aef37c"
        shape_string: "#74b391"
        shape_string_interpolation: "#83d2c0"
        shape_datetime: "#83d2c0"
        shape_list: "#83d2c0"
        shape_table: "#53a4fb"
        shape_record: "#83d2c0"
        shape_block: "#53a4fb"
        shape_filepath: "#79c8b6"
        shape_globpattern: "#83d2c0"
        shape_variable: "#fb5ea3"
        shape_flag: "#53a4fb"
        shape_custom: "#74b391"
        shape_nothing: "#83d2c0"
    }
}
