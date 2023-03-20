export def main [] {
    # extra desired values for the mono_white theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#262626"
    # foreground: "#fafafa"
    # cursor: "#fafafa"

    {
        # color for nushell primitives
        separator: "#fafafa"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#fafafa"
        empty: "#fafafa"
        bool: "#fafafa"
        int: "#fafafa"
        filesize: "#fafafa"
        duration: "#fafafa"
        date: "#fafafa"
        range: "#fafafa"
        float: "#fafafa"
        string: "#fafafa"
        nothing: "#fafafa"
        binary: "#fafafa"
        cellpath: "#fafafa"
        row_index: "#fafafa"
        record: "#fafafa"
        list: "#fafafa"
        block: "#fafafa"
        hints: "#fafafa"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#fafafa"
        shape_bool: "#fafafa"
        shape_int: "#fafafa"
        shape_float: "#fafafa"
        shape_range: "#fafafa"
        shape_internalcall: "#fafafa"
        shape_external: "#fafafa"
        shape_externalarg: "#fafafa"
        shape_literal: "#fafafa"
        shape_operator: "#fafafa"
        shape_signature: "#fafafa"
        shape_string: "#fafafa"
        shape_string_interpolation: "#fafafa"
        shape_datetime: "#fafafa"
        shape_list: "#fafafa"
        shape_table: "#fafafa"
        shape_record: "#fafafa"
        shape_block: "#fafafa"
        shape_filepath: "#fafafa"
        shape_globpattern: "#fafafa"
        shape_variable: "#fafafa"
        shape_flag: "#fafafa"
        shape_custom: "#fafafa"
        shape_nothing: "#fafafa"
    }
}
