export def main [] {
    # extra desired values for the vulcan theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#041523"
    # foreground: "#5b778c"
    # cursor: "#5b778c"

    {
        # color for nushell primitives
        separator: "#214d68"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#977d7c"
        empty: "#977d7c"
        bool: "#214d68"
        int: "#214d68"
        filesize: "#214d68"
        duration: "#214d68"
        date: "#214d68"
        range: "#214d68"
        float: "#214d68"
        string: "#214d68"
        nothing: "#214d68"
        binary: "#214d68"
        cellpath: "#214d68"
        row_index: "#977d7c"
        record: "#214d68"
        list: "#214d68"
        block: "#214d68"
        hints: "#7a5759"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9198a3"
        shape_bool: "#977d7c"
        shape_int: "#9198a3"
        shape_float: "#9198a3"
        shape_range: "#adb4b9"
        shape_internalcall: "#977d7c"
        shape_external: "#977d7c"
        shape_externalarg: "#977d7c"
        shape_literal: "#977d7c"
        shape_operator: "#adb4b9"
        shape_signature: "#977d7c"
        shape_string: "#977d7c"
        shape_string_interpolation: "#977d7c"
        shape_datetime: "#977d7c"
        shape_list: "#977d7c"
        shape_table: "#977d7c"
        shape_record: "#977d7c"
        shape_block: "#977d7c"
        shape_filepath: "#977d7c"
        shape_globpattern: "#977d7c"
        shape_variable: "#9198a3"
        shape_flag: "#977d7c"
        shape_custom: "#977d7c"
        shape_nothing: "#977d7c"
    }
}
