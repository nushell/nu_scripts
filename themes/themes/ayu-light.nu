export def main [] {
    # extra desired values for the ayu_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#fafafa"
    # foreground: "#5b6673"
    # cursor: "#ff6900"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b8e532"
        empty: "#41a6d9"
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
        row_index: "#b8e532"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#323232"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ffa3aa"
        shape_bool: "#7ff0cb"
        shape_int: "#ffa3aa"
        shape_float: "#ffa3aa"
        shape_range: "#ffc849"
        shape_internalcall: "#7ff0cb"
        shape_external: "#4cbe99"
        shape_externalarg: "#b8e532"
        shape_literal: "#41a6d9"
        shape_operator: "#f19618"
        shape_signature: "#b8e532"
        shape_string: "#86b200"
        shape_string_interpolation: "#7ff0cb"
        shape_datetime: "#7ff0cb"
        shape_list: "#7ff0cb"
        shape_table: "#73d7ff"
        shape_record: "#7ff0cb"
        shape_block: "#73d7ff"
        shape_filepath: "#4cbe99"
        shape_globpattern: "#7ff0cb"
        shape_variable: "#f07078"
        shape_flag: "#73d7ff"
        shape_custom: "#86b200"
        shape_nothing: "#7ff0cb"
    }
}
