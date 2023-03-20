export def main [] {
    # extra desired values for the substrata theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#191c25"
    # foreground: "#b5b4c9"
    # cursor: "#b5b4c9"

    {
        # color for nushell primitives
        separator: "#f0ecfe"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#92c47e"
        empty: "#8296b0"
        bool: "#f0ecfe"
        int: "#f0ecfe"
        filesize: "#f0ecfe"
        duration: "#f0ecfe"
        date: "#f0ecfe"
        range: "#f0ecfe"
        float: "#f0ecfe"
        string: "#f0ecfe"
        nothing: "#f0ecfe"
        binary: "#f0ecfe"
        cellpath: "#f0ecfe"
        row_index: "#92c47e"
        record: "#f0ecfe"
        list: "#f0ecfe"
        block: "#f0ecfe"
        hints: "#5b5f71"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c6aed7"
        shape_bool: "#7dc2c7"
        shape_int: "#c6aed7"
        shape_float: "#c6aed7"
        shape_range: "#d2b45f"
        shape_internalcall: "#7dc2c7"
        shape_external: "#659ea2"
        shape_externalarg: "#92c47e"
        shape_literal: "#8296b0"
        shape_operator: "#ab924c"
        shape_signature: "#92c47e"
        shape_string: "#76a065"
        shape_string_interpolation: "#7dc2c7"
        shape_datetime: "#7dc2c7"
        shape_list: "#7dc2c7"
        shape_table: "#a0b9d8"
        shape_record: "#7dc2c7"
        shape_block: "#a0b9d8"
        shape_filepath: "#659ea2"
        shape_globpattern: "#7dc2c7"
        shape_variable: "#a18daf"
        shape_flag: "#a0b9d8"
        shape_custom: "#76a065"
        shape_nothing: "#7dc2c7"
    }
}
