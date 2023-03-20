export def main [] {
    # extra desired values for the tokyo_night theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1a1b26"
    # foreground: "#c0caf5"
    # cursor: "#c0caf5"

    {
        # color for nushell primitives
        separator: "#c0caf5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#9ece6a"
        empty: "#7aa2f7"
        bool: "#c0caf5"
        int: "#c0caf5"
        filesize: "#c0caf5"
        duration: "#c0caf5"
        date: "#c0caf5"
        range: "#c0caf5"
        float: "#c0caf5"
        string: "#c0caf5"
        nothing: "#c0caf5"
        binary: "#c0caf5"
        cellpath: "#c0caf5"
        row_index: "#9ece6a"
        record: "#c0caf5"
        list: "#c0caf5"
        block: "#c0caf5"
        hints: "#414868"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#bb9af7"
        shape_bool: "#7dcfff"
        shape_int: "#bb9af7"
        shape_float: "#bb9af7"
        shape_range: "#e0af68"
        shape_internalcall: "#7dcfff"
        shape_external: "#7dcfff"
        shape_externalarg: "#9ece6a"
        shape_literal: "#7aa2f7"
        shape_operator: "#e0af68"
        shape_signature: "#9ece6a"
        shape_string: "#9ece6a"
        shape_string_interpolation: "#7dcfff"
        shape_datetime: "#7dcfff"
        shape_list: "#7dcfff"
        shape_table: "#7aa2f7"
        shape_record: "#7dcfff"
        shape_block: "#7aa2f7"
        shape_filepath: "#7dcfff"
        shape_globpattern: "#7dcfff"
        shape_variable: "#bb9af7"
        shape_flag: "#7aa2f7"
        shape_custom: "#9ece6a"
        shape_nothing: "#7dcfff"
    }
}
