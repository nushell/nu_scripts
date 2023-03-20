export def main [] {
    # extra desired values for the humanoid_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f8f8f2"
    # foreground: "#232629"
    # cursor: "#232629"

    {
        # color for nushell primitives
        separator: "#070708"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#388e3c"
        empty: "#0082c9"
        bool: "#070708"
        int: "#070708"
        filesize: "#070708"
        duration: "#070708"
        date: "#070708"
        range: "#070708"
        float: "#070708"
        string: "#070708"
        nothing: "#070708"
        binary: "#070708"
        cellpath: "#070708"
        row_index: "#388e3c"
        record: "#070708"
        list: "#070708"
        block: "#070708"
        hints: "#c0c0bd"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#700f98"
        shape_bool: "#008e8e"
        shape_int: "#700f98"
        shape_float: "#700f98"
        shape_range: "#ffb627"
        shape_internalcall: "#008e8e"
        shape_external: "#008e8e"
        shape_externalarg: "#388e3c"
        shape_literal: "#0082c9"
        shape_operator: "#ffb627"
        shape_signature: "#388e3c"
        shape_string: "#388e3c"
        shape_string_interpolation: "#008e8e"
        shape_datetime: "#008e8e"
        shape_list: "#008e8e"
        shape_table: "#0082c9"
        shape_record: "#008e8e"
        shape_block: "#0082c9"
        shape_filepath: "#008e8e"
        shape_globpattern: "#008e8e"
        shape_variable: "#700f98"
        shape_flag: "#0082c9"
        shape_custom: "#388e3c"
        shape_nothing: "#008e8e"
    }
}
