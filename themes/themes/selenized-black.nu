export def main [] {
    # extra desired values for the selenized_black theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#181818"
    # foreground: "#b9b9b9"
    # cursor: "#b9b9b9"

    {
        # color for nushell primitives
        separator: "#dedede"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#83c746"
        empty: "#368aeb"
        bool: "#dedede"
        int: "#dedede"
        filesize: "#dedede"
        duration: "#dedede"
        date: "#dedede"
        range: "#dedede"
        float: "#dedede"
        string: "#dedede"
        nothing: "#dedede"
        binary: "#dedede"
        cellpath: "#dedede"
        row_index: "#83c746"
        record: "#dedede"
        list: "#dedede"
        block: "#dedede"
        hints: "#3b3b3b"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff81ca"
        shape_bool: "#56d8c9"
        shape_int: "#ff81ca"
        shape_float: "#ff81ca"
        shape_range: "#efc541"
        shape_internalcall: "#56d8c9"
        shape_external: "#3fc5b7"
        shape_externalarg: "#83c746"
        shape_literal: "#368aeb"
        shape_operator: "#dbb32d"
        shape_signature: "#83c746"
        shape_string: "#70b433"
        shape_string_interpolation: "#56d8c9"
        shape_datetime: "#56d8c9"
        shape_list: "#56d8c9"
        shape_table: "#4f9cfe"
        shape_record: "#56d8c9"
        shape_block: "#4f9cfe"
        shape_filepath: "#3fc5b7"
        shape_globpattern: "#56d8c9"
        shape_variable: "#eb6eb7"
        shape_flag: "#4f9cfe"
        shape_custom: "#70b433"
        shape_nothing: "#56d8c9"
    }
}
