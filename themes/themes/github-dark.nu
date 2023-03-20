export def main [] {
    # extra desired values for the {{theme}} theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#24292e"
    # foreground: "#d1d5da"
    # cursor: "#c8e1ff"

    {
        # color for nushell primitives
        separator: "#fafbfc"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#85e89d"
        empty: "#2188ff"
        bool: "#fafbfc"
        int: "#fafbfc"
        filesize: "#fafbfc"
        duration: "#fafbfc"
        date: "#fafbfc"
        range: "#fafbfc"
        float: "#fafbfc"
        string: "#fafbfc"
        nothing: "#fafbfc"
        binary: "#fafbfc"
        cellpath: "#fafbfc"
        row_index: "#85e89d"
        record: "#fafbfc"
        list: "#fafbfc"
        block: "#fafbfc"
        hints: "#959da5"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b392f0"
        shape_bool: "#56d4dd"
        shape_int: "#b392f0"
        shape_float: "#b392f0"
        shape_range: "#ffea7f"
        shape_internalcall: "#56d4dd"
        shape_external: "#39c5cf"
        shape_externalarg: "#85e89d"
        shape_literal: "#2188ff"
        shape_operator: "#ffea7f"
        shape_signature: "#85e89d"
        shape_string: "#34d058"
        shape_string_interpolation: "#56d4dd"
        shape_datetime: "#56d4dd"
        shape_list: "#56d4dd"
        shape_table: "#79b8ff"
        shape_record: "#56d4dd"
        shape_block: "#79b8ff"
        shape_filepath: "#39c5cf"
        shape_globpattern: "#56d4dd"
        shape_variable: "#b392f0"
        shape_flag: "#79b8ff"
        shape_custom: "#34d058"
        shape_nothing: "#56d4dd"
    }
}
