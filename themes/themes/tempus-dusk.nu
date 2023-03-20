export def main [] {
    # extra desired values for the tempus_dusk theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1f252d"
    # foreground: "#a2a8ba"
    # cursor: "#a2a8ba"

    {
        # color for nushell primitives
        separator: "#a2a8ba"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#80b48f"
        empty: "#8c9abe"
        bool: "#a2a8ba"
        int: "#a2a8ba"
        filesize: "#a2a8ba"
        duration: "#a2a8ba"
        date: "#a2a8ba"
        range: "#a2a8ba"
        float: "#a2a8ba"
        string: "#a2a8ba"
        nothing: "#a2a8ba"
        binary: "#a2a8ba"
        cellpath: "#a2a8ba"
        row_index: "#80b48f"
        record: "#a2a8ba"
        list: "#a2a8ba"
        block: "#a2a8ba"
        hints: "#2c3150"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c69ac6"
        shape_bool: "#8caeb6"
        shape_int: "#c69ac6"
        shape_float: "#c69ac6"
        shape_range: "#bda75a"
        shape_internalcall: "#8caeb6"
        shape_external: "#8e9aba"
        shape_externalarg: "#80b48f"
        shape_literal: "#8c9abe"
        shape_operator: "#a79c46"
        shape_signature: "#80b48f"
        shape_string: "#8ba089"
        shape_string_interpolation: "#8caeb6"
        shape_datetime: "#8caeb6"
        shape_list: "#8caeb6"
        shape_table: "#9ca5de"
        shape_record: "#8caeb6"
        shape_block: "#9ca5de"
        shape_filepath: "#8e9aba"
        shape_globpattern: "#8caeb6"
        shape_variable: "#b190af"
        shape_flag: "#9ca5de"
        shape_custom: "#8ba089"
        shape_nothing: "#8caeb6"
    }
}
