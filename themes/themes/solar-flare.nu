export def main [] {
    # extra desired values for the solar_flare theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#18262F"
    # foreground: "#A6AFB8"
    # cursor: "#A6AFB8"

    {
        # color for nushell primitives
        separator: "#F5F7FA"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7CC844"
        empty: "#33B5E1"
        bool: "#F5F7FA"
        int: "#F5F7FA"
        filesize: "#F5F7FA"
        duration: "#F5F7FA"
        date: "#F5F7FA"
        range: "#F5F7FA"
        float: "#F5F7FA"
        string: "#F5F7FA"
        nothing: "#F5F7FA"
        binary: "#F5F7FA"
        cellpath: "#F5F7FA"
        row_index: "#7CC844"
        record: "#F5F7FA"
        list: "#F5F7FA"
        block: "#F5F7FA"
        hints: "#667581"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#A363D5"
        shape_bool: "#52CBB0"
        shape_int: "#A363D5"
        shape_float: "#A363D5"
        shape_range: "#E4B51C"
        shape_internalcall: "#52CBB0"
        shape_external: "#52CBB0"
        shape_externalarg: "#7CC844"
        shape_literal: "#33B5E1"
        shape_operator: "#E4B51C"
        shape_signature: "#7CC844"
        shape_string: "#7CC844"
        shape_string_interpolation: "#52CBB0"
        shape_datetime: "#52CBB0"
        shape_list: "#52CBB0"
        shape_table: "#33B5E1"
        shape_record: "#52CBB0"
        shape_block: "#33B5E1"
        shape_filepath: "#52CBB0"
        shape_globpattern: "#52CBB0"
        shape_variable: "#A363D5"
        shape_flag: "#33B5E1"
        shape_custom: "#7CC844"
        shape_nothing: "#52CBB0"
    }
}
