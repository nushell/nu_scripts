export def main [] {
    # extra desired values for the snazzy theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#282a36"
    # foreground: "#e2e4e5"
    # cursor: "#e2e4e5"

    {
        # color for nushell primitives
        separator: "#f1f1f0"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#5af78e"
        empty: "#57c7ff"
        bool: "#f1f1f0"
        int: "#f1f1f0"
        filesize: "#f1f1f0"
        duration: "#f1f1f0"
        date: "#f1f1f0"
        range: "#f1f1f0"
        float: "#f1f1f0"
        string: "#f1f1f0"
        nothing: "#f1f1f0"
        binary: "#f1f1f0"
        cellpath: "#f1f1f0"
        row_index: "#5af78e"
        record: "#f1f1f0"
        list: "#f1f1f0"
        block: "#f1f1f0"
        hints: "#78787e"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff6ac1"
        shape_bool: "#9aedfe"
        shape_int: "#ff6ac1"
        shape_float: "#ff6ac1"
        shape_range: "#f3f99d"
        shape_internalcall: "#9aedfe"
        shape_external: "#9aedfe"
        shape_externalarg: "#5af78e"
        shape_literal: "#57c7ff"
        shape_operator: "#f3f99d"
        shape_signature: "#5af78e"
        shape_string: "#5af78e"
        shape_string_interpolation: "#9aedfe"
        shape_datetime: "#9aedfe"
        shape_list: "#9aedfe"
        shape_table: "#57c7ff"
        shape_record: "#9aedfe"
        shape_block: "#57c7ff"
        shape_filepath: "#9aedfe"
        shape_globpattern: "#9aedfe"
        shape_variable: "#ff6ac1"
        shape_flag: "#57c7ff"
        shape_custom: "#5af78e"
        shape_nothing: "#9aedfe"
    }
}
