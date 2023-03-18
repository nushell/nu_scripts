export def main [] {
    # extra desired values for the mexico_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f8f8f8"
    # foreground: "#383838"
    # cursor: "#383838"

    {
        # color for nushell primitives
        separator: "#181818"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#538947"
        empty: "#7cafc2"
        bool: "#181818"
        int: "#181818"
        filesize: "#181818"
        duration: "#181818"
        date: "#181818"
        range: "#181818"
        float: "#181818"
        string: "#181818"
        nothing: "#181818"
        binary: "#181818"
        cellpath: "#181818"
        row_index: "#538947"
        record: "#181818"
        list: "#181818"
        block: "#181818"
        hints: "#b8b8b8"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#96609e"
        shape_bool: "#4b8093"
        shape_int: "#96609e"
        shape_float: "#96609e"
        shape_range: "#f79a0e"
        shape_internalcall: "#4b8093"
        shape_external: "#4b8093"
        shape_externalarg: "#538947"
        shape_literal: "#7cafc2"
        shape_operator: "#f79a0e"
        shape_signature: "#538947"
        shape_string: "#538947"
        shape_string_interpolation: "#4b8093"
        shape_datetime: "#4b8093"
        shape_list: "#4b8093"
        shape_table: "#7cafc2"
        shape_record: "#4b8093"
        shape_block: "#7cafc2"
        shape_filepath: "#4b8093"
        shape_globpattern: "#4b8093"
        shape_variable: "#96609e"
        shape_flag: "#7cafc2"
        shape_custom: "#538947"
        shape_nothing: "#4b8093"
    }
}
