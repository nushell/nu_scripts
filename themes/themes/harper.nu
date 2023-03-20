export def main [] {
    # extra desired values for the harper theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#010101"
    # foreground: "#a8a49d"
    # cursor: "#a8a49d"

    {
        # color for nushell primitives
        separator: "#fefbea"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7fb5e1"
        empty: "#489e48"
        bool: "#fefbea"
        int: "#fefbea"
        filesize: "#fefbea"
        duration: "#fefbea"
        date: "#fefbea"
        range: "#fefbea"
        float: "#fefbea"
        string: "#fefbea"
        nothing: "#fefbea"
        binary: "#fefbea"
        cellpath: "#fefbea"
        row_index: "#7fb5e1"
        record: "#fefbea"
        list: "#fefbea"
        block: "#fefbea"
        hints: "#726e6a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b296c6"
        shape_bool: "#f5bfd7"
        shape_int: "#b296c6"
        shape_float: "#b296c6"
        shape_range: "#d6da25"
        shape_internalcall: "#f5bfd7"
        shape_external: "#f5bfd7"
        shape_externalarg: "#7fb5e1"
        shape_literal: "#489e48"
        shape_operator: "#d6da25"
        shape_signature: "#7fb5e1"
        shape_string: "#7fb5e1"
        shape_string_interpolation: "#f5bfd7"
        shape_datetime: "#f5bfd7"
        shape_list: "#f5bfd7"
        shape_table: "#489e48"
        shape_record: "#f5bfd7"
        shape_block: "#489e48"
        shape_filepath: "#f5bfd7"
        shape_globpattern: "#f5bfd7"
        shape_variable: "#b296c6"
        shape_flag: "#489e48"
        shape_custom: "#7fb5e1"
        shape_nothing: "#f5bfd7"
    }
}
