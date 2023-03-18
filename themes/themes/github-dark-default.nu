export def main [] {
    # extra desired values for the {{theme}} theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "{{background}}"
    # foreground: "{{foreground}}"
    # cursor: "{{cursor}}"

    {
        # color for nushell primitives
        separator: "{{color15}}"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "{{color10}}"
        empty: "{{color4}}"
        bool: "{{color15}}"
        int: "{{color15}}"
        filesize: "{{color15}}"
        duration: "{{color15}}"
        date: "{{color15}}"
        range: "{{color15}}"
        float: "{{color15}}"
        string: "{{color15}}"
        nothing: "{{color15}}"
        binary: "{{color15}}"
        cellpath: "{{color15}}"
        row_index: "{{color10}}"
        record: "{{color15}}"
        list: "{{color15}}"
        block: "{{color15}}"
        hints: "{{color8}}"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "{{color13}}"
        shape_bool: "{{color14}}"
        shape_int: "{{color13}}"
        shape_float: "{{color13}}"
        shape_range: "{{color11}}"
        shape_internalcall: "{{color14}}"
        shape_external: "{{color6}}"
        shape_externalarg: "{{color10}}"
        shape_literal: "{{color4}}"
        shape_operator: "{{color3}}"
        shape_signature: "{{color10}}"
        shape_string: "{{color2}}"
        shape_string_interpolation: "{{color14}}"
        shape_datetime: "{{color14}}"
        shape_list: "{{color14}}"
        shape_table: "{{color12}}"
        shape_record: "{{color14}}"
        shape_block: "{{color12}}"
        shape_filepath: "{{color6}}"
        shape_globpattern: "{{color14}}"
        shape_variable: "{{color5}}"
        shape_flag: "{{color12}}"
        shape_custom: "{{color2}}"
        shape_nothing: "{{color14}}"
    }
}
