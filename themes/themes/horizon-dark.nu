export def main [] {
    # extra desired values for the horizon_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1c1e26"
    # foreground: "#cbced0"
    # cursor: "#cbced0"

    {
        # color for nushell primitives
        separator: "#e3e6ee"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#efaf8e"
        empty: "#df5273"
        bool: "#e3e6ee"
        int: "#e3e6ee"
        filesize: "#e3e6ee"
        duration: "#e3e6ee"
        date: "#e3e6ee"
        range: "#e3e6ee"
        float: "#e3e6ee"
        string: "#e3e6ee"
        nothing: "#e3e6ee"
        binary: "#e3e6ee"
        cellpath: "#e3e6ee"
        row_index: "#efaf8e"
        record: "#e3e6ee"
        list: "#e3e6ee"
        block: "#e3e6ee"
        hints: "#6f6f70"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b072d1"
        shape_bool: "#24a8b4"
        shape_int: "#b072d1"
        shape_float: "#b072d1"
        shape_range: "#efb993"
        shape_internalcall: "#24a8b4"
        shape_external: "#24a8b4"
        shape_externalarg: "#efaf8e"
        shape_literal: "#df5273"
        shape_operator: "#efb993"
        shape_signature: "#efaf8e"
        shape_string: "#efaf8e"
        shape_string_interpolation: "#24a8b4"
        shape_datetime: "#24a8b4"
        shape_list: "#24a8b4"
        shape_table: "#df5273"
        shape_record: "#24a8b4"
        shape_block: "#df5273"
        shape_filepath: "#24a8b4"
        shape_globpattern: "#24a8b4"
        shape_variable: "#b072d1"
        shape_flag: "#df5273"
        shape_custom: "#efaf8e"
        shape_nothing: "#24a8b4"
    }
}
