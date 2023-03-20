export def main [] {
    # extra desired values for the ic_orange-ppl theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#262626"
    # foreground: "#ffcb83"
    # cursor: "#ffcb83"

    {
        # color for nushell primitives
        separator: "#fafaff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#f6ff40"
        empty: "#bd6d00"
        bool: "#fafaff"
        int: "#fafaff"
        filesize: "#fafaff"
        duration: "#fafaff"
        date: "#fafaff"
        range: "#fafaff"
        float: "#fafaff"
        string: "#fafaff"
        nothing: "#fafaff"
        binary: "#fafaff"
        cellpath: "#fafaff"
        row_index: "#f6ff40"
        record: "#fafaff"
        list: "#fafaff"
        block: "#fafaff"
        hints: "#6a4f2a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#fc874f"
        shape_bool: "#c69752"
        shape_int: "#fc874f"
        shape_float: "#fc874f"
        shape_range: "#ffe36e"
        shape_internalcall: "#c69752"
        shape_external: "#f79500"
        shape_externalarg: "#f6ff40"
        shape_literal: "#bd6d00"
        shape_operator: "#caaf00"
        shape_signature: "#f6ff40"
        shape_string: "#a4a900"
        shape_string_interpolation: "#c69752"
        shape_datetime: "#c69752"
        shape_list: "#c69752"
        shape_table: "#ffbe55"
        shape_record: "#c69752"
        shape_block: "#ffbe55"
        shape_filepath: "#f79500"
        shape_globpattern: "#c69752"
        shape_variable: "#fc5e00"
        shape_flag: "#ffbe55"
        shape_custom: "#a4a900"
        shape_nothing: "#c69752"
    }
}
