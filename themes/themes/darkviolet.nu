export def main [] {
    # extra desired values for the darkviolet theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#000000"
    # foreground: "#b08ae6"
    # cursor: "#b08ae6"

    {
        # color for nushell primitives
        separator: "#a366ff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#4595e6"
        empty: "#4136d9"
        bool: "#a366ff"
        int: "#a366ff"
        filesize: "#a366ff"
        duration: "#a366ff"
        date: "#a366ff"
        range: "#a366ff"
        float: "#a366ff"
        string: "#a366ff"
        nothing: "#a366ff"
        binary: "#a366ff"
        cellpath: "#a366ff"
        row_index: "#4595e6"
        record: "#a366ff"
        list: "#a366ff"
        block: "#a366ff"
        hints: "#593380"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#7e5ce6"
        shape_bool: "#40dfff"
        shape_int: "#7e5ce6"
        shape_float: "#7e5ce6"
        shape_range: "#f29df2"
        shape_internalcall: "#40dfff"
        shape_external: "#40dfff"
        shape_externalarg: "#4595e6"
        shape_literal: "#4136d9"
        shape_operator: "#f29df2"
        shape_signature: "#4595e6"
        shape_string: "#4595e6"
        shape_string_interpolation: "#40dfff"
        shape_datetime: "#40dfff"
        shape_list: "#40dfff"
        shape_table: "#4136d9"
        shape_record: "#40dfff"
        shape_block: "#4136d9"
        shape_filepath: "#40dfff"
        shape_globpattern: "#40dfff"
        shape_variable: "#7e5ce6"
        shape_flag: "#4136d9"
        shape_custom: "#4595e6"
        shape_nothing: "#40dfff"
    }
}
