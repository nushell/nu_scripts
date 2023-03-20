export def main [] {
    # extra desired values for the jellybeans theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#121212"
    # foreground: "#dedede"
    # cursor: "#dedede"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#bddeab"
        empty: "#97bedc"
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
        row_index: "#bddeab"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#bdbdbd"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#fbdaff"
        shape_bool: "#1ab2a8"
        shape_int: "#fbdaff"
        shape_float: "#fbdaff"
        shape_range: "#ffdca0"
        shape_internalcall: "#1ab2a8"
        shape_external: "#00988e"
        shape_externalarg: "#bddeab"
        shape_literal: "#97bedc"
        shape_operator: "#ffba7b"
        shape_signature: "#bddeab"
        shape_string: "#94b979"
        shape_string_interpolation: "#1ab2a8"
        shape_datetime: "#1ab2a8"
        shape_list: "#1ab2a8"
        shape_table: "#b1d8f6"
        shape_record: "#1ab2a8"
        shape_block: "#b1d8f6"
        shape_filepath: "#00988e"
        shape_globpattern: "#1ab2a8"
        shape_variable: "#e1c0fa"
        shape_flag: "#b1d8f6"
        shape_custom: "#94b979"
        shape_nothing: "#1ab2a8"
    }
}
