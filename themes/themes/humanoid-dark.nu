export def main [] {
    # extra desired values for the humanoid_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#232629"
    # foreground: "#f8f8f2"
    # cursor: "#f8f8f2"

    {
        # color for nushell primitives
        separator: "#fcfcfc"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#02d849"
        empty: "#00a6fb"
        bool: "#fcfcfc"
        int: "#fcfcfc"
        filesize: "#fcfcfc"
        duration: "#fcfcfc"
        date: "#fcfcfc"
        range: "#fcfcfc"
        float: "#fcfcfc"
        string: "#fcfcfc"
        nothing: "#fcfcfc"
        binary: "#fcfcfc"
        cellpath: "#fcfcfc"
        row_index: "#02d849"
        record: "#fcfcfc"
        list: "#fcfcfc"
        block: "#fcfcfc"
        hints: "#60615d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#f15ee3"
        shape_bool: "#0dd9d6"
        shape_int: "#f15ee3"
        shape_float: "#f15ee3"
        shape_range: "#ffb627"
        shape_internalcall: "#0dd9d6"
        shape_external: "#0dd9d6"
        shape_externalarg: "#02d849"
        shape_literal: "#00a6fb"
        shape_operator: "#ffb627"
        shape_signature: "#02d849"
        shape_string: "#02d849"
        shape_string_interpolation: "#0dd9d6"
        shape_datetime: "#0dd9d6"
        shape_list: "#0dd9d6"
        shape_table: "#00a6fb"
        shape_record: "#0dd9d6"
        shape_block: "#00a6fb"
        shape_filepath: "#0dd9d6"
        shape_globpattern: "#0dd9d6"
        shape_variable: "#f15ee3"
        shape_flag: "#00a6fb"
        shape_custom: "#02d849"
        shape_nothing: "#0dd9d6"
    }
}
