export def main [] {
    # extra desired values for the brogrammer theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1f1f1f"
    # foreground: "#4e5ab7"
    # cursor: "#4e5ab7"

    {
        # color for nushell primitives
        separator: "#d6dbe5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#f3bd09"
        empty: "#5350b9"
        bool: "#d6dbe5"
        int: "#d6dbe5"
        filesize: "#d6dbe5"
        duration: "#d6dbe5"
        date: "#d6dbe5"
        range: "#d6dbe5"
        float: "#d6dbe5"
        string: "#d6dbe5"
        nothing: "#d6dbe5"
        binary: "#d6dbe5"
        cellpath: "#d6dbe5"
        row_index: "#f3bd09"
        record: "#d6dbe5"
        list: "#d6dbe5"
        block: "#d6dbe5"
        hints: "#ecba0f"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#0f7ddb"
        shape_bool: "#1081d6"
        shape_int: "#0f7ddb"
        shape_float: "#0f7ddb"
        shape_range: "#1dd361"
        shape_internalcall: "#1081d6"
        shape_external: "#1081d6"
        shape_externalarg: "#f3bd09"
        shape_literal: "#5350b9"
        shape_operator: "#1dd361"
        shape_signature: "#f3bd09"
        shape_string: "#f3bd09"
        shape_string_interpolation: "#1081d6"
        shape_datetime: "#1081d6"
        shape_list: "#1081d6"
        shape_table: "#5350b9"
        shape_record: "#1081d6"
        shape_block: "#5350b9"
        shape_filepath: "#1081d6"
        shape_globpattern: "#1081d6"
        shape_variable: "#0f7ddb"
        shape_flag: "#5350b9"
        shape_custom: "#f3bd09"
        shape_nothing: "#1081d6"
    }
}
