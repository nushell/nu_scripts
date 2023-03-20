export def main [] {
    # extra desired values for the tempus_future theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#090a18"
    # foreground: "#b4abac"
    # cursor: "#b4abac"

    {
        # color for nushell primitives
        separator: "#b4abac"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#60ba80"
        empty: "#4aaed3"
        bool: "#b4abac"
        int: "#b4abac"
        filesize: "#b4abac"
        duration: "#b4abac"
        date: "#b4abac"
        range: "#b4abac"
        float: "#b4abac"
        string: "#b4abac"
        nothing: "#b4abac"
        binary: "#b4abac"
        cellpath: "#b4abac"
        row_index: "#60ba80"
        record: "#b4abac"
        list: "#b4abac"
        block: "#b4abac"
        hints: "#260e22"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#e08bd6"
        shape_bool: "#2cbab6"
        shape_int: "#e08bd6"
        shape_float: "#e08bd6"
        shape_range: "#de9b1d"
        shape_internalcall: "#2cbab6"
        shape_external: "#29b3bb"
        shape_externalarg: "#60ba80"
        shape_literal: "#4aaed3"
        shape_operator: "#bfa01a"
        shape_signature: "#60ba80"
        shape_string: "#6ab539"
        shape_string_interpolation: "#2cbab6"
        shape_datetime: "#2cbab6"
        shape_list: "#2cbab6"
        shape_table: "#8ba7ea"
        shape_record: "#2cbab6"
        shape_block: "#8ba7ea"
        shape_filepath: "#29b3bb"
        shape_globpattern: "#2cbab6"
        shape_variable: "#e58a82"
        shape_flag: "#8ba7ea"
        shape_custom: "#6ab539"
        shape_nothing: "#2cbab6"
    }
}
