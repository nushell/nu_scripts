export def main [] {
    # extra desired values for the ia_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1a1a1a"
    # foreground: "#cccccc"
    # cursor: "#cccccc"

    {
        # color for nushell primitives
        separator: "#f8f8f8"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#83a471"
        empty: "#8eccdd"
        bool: "#f8f8f8"
        int: "#f8f8f8"
        filesize: "#f8f8f8"
        duration: "#f8f8f8"
        date: "#f8f8f8"
        range: "#f8f8f8"
        float: "#f8f8f8"
        string: "#f8f8f8"
        nothing: "#f8f8f8"
        binary: "#f8f8f8"
        cellpath: "#f8f8f8"
        row_index: "#83a471"
        record: "#f8f8f8"
        list: "#f8f8f8"
        block: "#f8f8f8"
        hints: "#767676"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b98eb2"
        shape_bool: "#7c9cae"
        shape_int: "#b98eb2"
        shape_float: "#b98eb2"
        shape_range: "#b99353"
        shape_internalcall: "#7c9cae"
        shape_external: "#7c9cae"
        shape_externalarg: "#83a471"
        shape_literal: "#8eccdd"
        shape_operator: "#b99353"
        shape_signature: "#83a471"
        shape_string: "#83a471"
        shape_string_interpolation: "#7c9cae"
        shape_datetime: "#7c9cae"
        shape_list: "#7c9cae"
        shape_table: "#8eccdd"
        shape_record: "#7c9cae"
        shape_block: "#8eccdd"
        shape_filepath: "#7c9cae"
        shape_globpattern: "#7c9cae"
        shape_variable: "#b98eb2"
        shape_flag: "#8eccdd"
        shape_custom: "#83a471"
        shape_nothing: "#7c9cae"
    }
}
