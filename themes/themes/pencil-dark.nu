export def main [] {
    # extra desired values for the pencil_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#212121"
    # foreground: "#f1f1f1"
    # cursor: "#f1f1f1"

    {
        # color for nushell primitives
        separator: "#f1f1f1"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#5fd7af"
        empty: "#008ec4"
        bool: "#f1f1f1"
        int: "#f1f1f1"
        filesize: "#f1f1f1"
        duration: "#f1f1f1"
        date: "#f1f1f1"
        range: "#f1f1f1"
        float: "#f1f1f1"
        string: "#f1f1f1"
        nothing: "#f1f1f1"
        binary: "#f1f1f1"
        cellpath: "#f1f1f1"
        row_index: "#5fd7af"
        record: "#f1f1f1"
        list: "#f1f1f1"
        block: "#f1f1f1"
        hints: "#424242"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#6855de"
        shape_bool: "#4fb8cc"
        shape_int: "#6855de"
        shape_float: "#6855de"
        shape_range: "#f3e430"
        shape_internalcall: "#4fb8cc"
        shape_external: "#20a5ba"
        shape_externalarg: "#5fd7af"
        shape_literal: "#008ec4"
        shape_operator: "#a89c14"
        shape_signature: "#5fd7af"
        shape_string: "#10a778"
        shape_string_interpolation: "#4fb8cc"
        shape_datetime: "#4fb8cc"
        shape_list: "#4fb8cc"
        shape_table: "#20bbfc"
        shape_record: "#4fb8cc"
        shape_block: "#20bbfc"
        shape_filepath: "#20a5ba"
        shape_globpattern: "#4fb8cc"
        shape_variable: "#523c79"
        shape_flag: "#20bbfc"
        shape_custom: "#10a778"
        shape_nothing: "#4fb8cc"
    }
}
