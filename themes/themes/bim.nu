export def main [] {
    # extra desired values for the bim theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#012849"
    # foreground: "#a9bed8"
    # cursor: "#a9bed8"

    {
        # color for nushell primitives
        separator: "#f5eeec"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#bbee78"
        empty: "#5ea2ec"
        bool: "#f5eeec"
        int: "#f5eeec"
        filesize: "#f5eeec"
        duration: "#f5eeec"
        date: "#f5eeec"
        range: "#f5eeec"
        float: "#f5eeec"
        string: "#f5eeec"
        nothing: "#f5eeec"
        binary: "#f5eeec"
        cellpath: "#f5eeec"
        row_index: "#bbee78"
        record: "#f5eeec"
        list: "#f5eeec"
        block: "#f5eeec"
        hints: "#918988"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#bb79ec"
        shape_bool: "#81eeb2"
        shape_int: "#bb79ec"
        shape_float: "#bb79ec"
        shape_range: "#f5b378"
        shape_internalcall: "#81eeb2"
        shape_external: "#5eeea0"
        shape_externalarg: "#bbee78"
        shape_literal: "#5ea2ec"
        shape_operator: "#f5a255"
        shape_signature: "#bbee78"
        shape_string: "#a9ee55"
        shape_string_interpolation: "#81eeb2"
        shape_datetime: "#81eeb2"
        shape_list: "#81eeb2"
        shape_table: "#81b3ec"
        shape_record: "#81eeb2"
        shape_block: "#81b3ec"
        shape_filepath: "#5eeea0"
        shape_globpattern: "#81eeb2"
        shape_variable: "#a957ec"
        shape_flag: "#81b3ec"
        shape_custom: "#a9ee55"
        shape_nothing: "#81eeb2"
    }
}
