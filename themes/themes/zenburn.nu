export def main [] {
    # extra desired values for the zenburn theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#383838"
    # foreground: "#dcdccc"
    # cursor: "#dcdccc"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#5f7f5f"
        empty: "#7cb8bb"
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
        row_index: "#5f7f5f"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#6f6f6f"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#dc8cc3"
        shape_bool: "#93e0e3"
        shape_int: "#dc8cc3"
        shape_float: "#dc8cc3"
        shape_range: "#e0cf9f"
        shape_internalcall: "#93e0e3"
        shape_external: "#93e0e3"
        shape_externalarg: "#5f7f5f"
        shape_literal: "#7cb8bb"
        shape_operator: "#e0cf9f"
        shape_signature: "#5f7f5f"
        shape_string: "#5f7f5f"
        shape_string_interpolation: "#93e0e3"
        shape_datetime: "#93e0e3"
        shape_list: "#93e0e3"
        shape_table: "#7cb8bb"
        shape_record: "#93e0e3"
        shape_block: "#7cb8bb"
        shape_filepath: "#93e0e3"
        shape_globpattern: "#93e0e3"
        shape_variable: "#dc8cc3"
        shape_flag: "#7cb8bb"
        shape_custom: "#5f7f5f"
        shape_nothing: "#93e0e3"
    }
}
