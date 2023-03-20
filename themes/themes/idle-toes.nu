export def main [] {
    # extra desired values for the idle_toes theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#323232"
    # foreground: "#ffffff"
    # cursor: "#ffffff"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#9dff91"
        empty: "#4099ff"
        bool: "#ffffff"
        int: "#ffffff"
        filesize: "#ffffff"
        duration: "#ffffff"
        date: "#ffffff"
        range: "#ffffff"
        float: "#ffffff"
        string: "#ffffff"
        nothing: "#ffffff"
        binary: "#ffffff"
        cellpath: "#ffffff"
        row_index: "#9dff91"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#535353"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff9dff"
        shape_bool: "#dcf4ff"
        shape_int: "#ff9dff"
        shape_float: "#ff9dff"
        shape_range: "#ffe48b"
        shape_internalcall: "#dcf4ff"
        shape_external: "#bed6ff"
        shape_externalarg: "#9dff91"
        shape_literal: "#4099ff"
        shape_operator: "#ffc66d"
        shape_signature: "#9dff91"
        shape_string: "#7fe173"
        shape_string_interpolation: "#dcf4ff"
        shape_datetime: "#dcf4ff"
        shape_list: "#dcf4ff"
        shape_table: "#5eb7f7"
        shape_record: "#dcf4ff"
        shape_block: "#5eb7f7"
        shape_filepath: "#bed6ff"
        shape_globpattern: "#dcf4ff"
        shape_variable: "#f680ff"
        shape_flag: "#5eb7f7"
        shape_custom: "#7fe173"
        shape_nothing: "#dcf4ff"
    }
}
