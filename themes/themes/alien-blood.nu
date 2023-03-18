export def main [] {
    # extra desired values for the alien_blood theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0f1610"
    # foreground: "#637d75"
    # cursor: "#637d75"

    {
        # color for nushell primitives
        separator: "#73fa91"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#18e000"
        empty: "#2f6a7f"
        bool: "#73fa91"
        int: "#73fa91"
        filesize: "#73fa91"
        duration: "#73fa91"
        date: "#73fa91"
        range: "#73fa91"
        float: "#73fa91"
        string: "#73fa91"
        nothing: "#73fa91"
        binary: "#73fa91"
        cellpath: "#73fa91"
        row_index: "#18e000"
        record: "#73fa91"
        list: "#73fa91"
        block: "#73fa91"
        hints: "#3c4812"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#0058e0"
        shape_bool: "#00e0c4"
        shape_int: "#0058e0"
        shape_float: "#0058e0"
        shape_range: "#bde000"
        shape_internalcall: "#00e0c4"
        shape_external: "#327f77"
        shape_externalarg: "#18e000"
        shape_literal: "#2f6a7f"
        shape_operator: "#717f24"
        shape_signature: "#18e000"
        shape_string: "#2f7e25"
        shape_string_interpolation: "#00e0c4"
        shape_datetime: "#00e0c4"
        shape_list: "#00e0c4"
        shape_table: "#00aae0"
        shape_record: "#00e0c4"
        shape_block: "#00aae0"
        shape_filepath: "#327f77"
        shape_globpattern: "#00e0c4"
        shape_variable: "#47587f"
        shape_flag: "#00aae0"
        shape_custom: "#2f7e25"
        shape_nothing: "#00e0c4"
    }
}
