export def main [] {
    # extra desired values for the spiderman theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1b1d1e"
    # foreground: "#e2e2e2"
    # cursor: "#2b3fff"

    {
        # color for nushell primitives
        separator: "#fefff9"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#ff3238"
        empty: "#2b3fff"
        bool: "#fefff9"
        int: "#fefff9"
        filesize: "#fefff9"
        duration: "#fefff9"
        date: "#fefff9"
        range: "#fefff9"
        float: "#fefff9"
        string: "#fefff9"
        nothing: "#fefff9"
        binary: "#fefff9"
        cellpath: "#fefff9"
        row_index: "#ff3238"
        record: "#fefff9"
        list: "#fefff9"
        block: "#fefff9"
        hints: "#505354"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#737bff"
        shape_bool: "#6083ff"
        shape_int: "#737bff"
        shape_float: "#737bff"
        shape_range: "#fe3935"
        shape_internalcall: "#6083ff"
        shape_external: "#3255ff"
        shape_externalarg: "#ff3238"
        shape_literal: "#2b3fff"
        shape_operator: "#e24655"
        shape_signature: "#ff3238"
        shape_string: "#e22828"
        shape_string_interpolation: "#6083ff"
        shape_datetime: "#6083ff"
        shape_list: "#6083ff"
        shape_table: "#1d4fff"
        shape_record: "#6083ff"
        shape_block: "#1d4fff"
        shape_filepath: "#3255ff"
        shape_globpattern: "#6083ff"
        shape_variable: "#2435db"
        shape_flag: "#1d4fff"
        shape_custom: "#e22828"
        shape_nothing: "#6083ff"
    }
}
