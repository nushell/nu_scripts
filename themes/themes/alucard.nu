export def main [] {
    # extra desired values for the alucard theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#222330"
    # foreground: "#cef3ff"
    # cursor: "#ffffff"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#50fa7b"
        empty: "#3282ff"
        bool: "#ffffff"
        int: "#ffffff"
        filesize: "#ffffff"
        duration: "#ffffff"
        date: "#ffffff"
        range: "#ffffff"
        float: "#ffffff"
        string: "#ffffff"
        nothing: "#ffffff"
        binary: "#ffffff"
        cellpath: "#ffffff"
        row_index: "#50fa7b"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#545454"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff78c5"
        shape_bool: "#8ae9fc"
        shape_int: "#ff78c5"
        shape_float: "#ff78c5"
        shape_range: "#f0fa8b"
        shape_internalcall: "#8ae9fc"
        shape_external: "#0037fc"
        shape_externalarg: "#50fa7b"
        shape_literal: "#3282ff"
        shape_operator: "#7f0a1f"
        shape_signature: "#50fa7b"
        shape_string: "#fa0074"
        shape_string_interpolation: "#8ae9fc"
        shape_datetime: "#8ae9fc"
        shape_list: "#8ae9fc"
        shape_table: "#1200f8"
        shape_record: "#8ae9fc"
        shape_block: "#1200f8"
        shape_filepath: "#0037fc"
        shape_globpattern: "#8ae9fc"
        shape_variable: "#1b3cff"
        shape_flag: "#1200f8"
        shape_custom: "#fa0074"
        shape_nothing: "#8ae9fc"
    }
}
