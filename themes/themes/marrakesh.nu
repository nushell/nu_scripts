export def main [] {
    # extra desired values for the marrakesh theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#201602"
    # foreground: "#948e48"
    # cursor: "#948e48"

    {
        # color for nushell primitives
        separator: "#faf0a5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#18974e"
        empty: "#477ca1"
        bool: "#faf0a5"
        int: "#faf0a5"
        filesize: "#faf0a5"
        duration: "#faf0a5"
        date: "#faf0a5"
        range: "#faf0a5"
        float: "#faf0a5"
        string: "#faf0a5"
        nothing: "#faf0a5"
        binary: "#faf0a5"
        cellpath: "#faf0a5"
        row_index: "#18974e"
        record: "#faf0a5"
        list: "#faf0a5"
        block: "#faf0a5"
        hints: "#6c6823"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8868b3"
        shape_bool: "#75a738"
        shape_int: "#8868b3"
        shape_float: "#8868b3"
        shape_range: "#a88339"
        shape_internalcall: "#75a738"
        shape_external: "#75a738"
        shape_externalarg: "#18974e"
        shape_literal: "#477ca1"
        shape_operator: "#a88339"
        shape_signature: "#18974e"
        shape_string: "#18974e"
        shape_string_interpolation: "#75a738"
        shape_datetime: "#75a738"
        shape_list: "#75a738"
        shape_table: "#477ca1"
        shape_record: "#75a738"
        shape_block: "#477ca1"
        shape_filepath: "#75a738"
        shape_globpattern: "#75a738"
        shape_variable: "#8868b3"
        shape_flag: "#477ca1"
        shape_custom: "#18974e"
        shape_nothing: "#75a738"
    }
}
