export def main [] {
    # extra desired values for the danqing theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2d302f"
    # foreground: "#e0f0ef"
    # cursor: "#e0f0ef"

    {
        # color for nushell primitives
        separator: "#fcfefd"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8ab361"
        empty: "#b0a4e3"
        bool: "#fcfefd"
        int: "#fcfefd"
        filesize: "#fcfefd"
        duration: "#fcfefd"
        date: "#fcfefd"
        range: "#fcfefd"
        float: "#fcfefd"
        string: "#fcfefd"
        nothing: "#fcfefd"
        binary: "#fcfefd"
        cellpath: "#fcfefd"
        row_index: "#8ab361"
        record: "#fcfefd"
        list: "#fcfefd"
        block: "#fcfefd"
        hints: "#9da8a3"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#cca4e3"
        shape_bool: "#30dff3"
        shape_int: "#cca4e3"
        shape_float: "#cca4e3"
        shape_range: "#f0c239"
        shape_internalcall: "#30dff3"
        shape_external: "#30dff3"
        shape_externalarg: "#8ab361"
        shape_literal: "#b0a4e3"
        shape_operator: "#f0c239"
        shape_signature: "#8ab361"
        shape_string: "#8ab361"
        shape_string_interpolation: "#30dff3"
        shape_datetime: "#30dff3"
        shape_list: "#30dff3"
        shape_table: "#b0a4e3"
        shape_record: "#30dff3"
        shape_block: "#b0a4e3"
        shape_filepath: "#30dff3"
        shape_globpattern: "#30dff3"
        shape_variable: "#cca4e3"
        shape_flag: "#b0a4e3"
        shape_custom: "#8ab361"
        shape_nothing: "#30dff3"
    }
}
