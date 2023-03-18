export def main [] {
    # extra desired values for the selenized_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#fbf3db"
    # foreground: "#53676d"
    # cursor: "#53676d"

    {
        # color for nushell primitives
        separator: "#3a4d53"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#428b00"
        empty: "#0072d4"
        bool: "#3a4d53"
        int: "#3a4d53"
        filesize: "#3a4d53"
        duration: "#3a4d53"
        date: "#3a4d53"
        range: "#3a4d53"
        float: "#3a4d53"
        string: "#3a4d53"
        nothing: "#3a4d53"
        binary: "#3a4d53"
        cellpath: "#3a4d53"
        row_index: "#428b00"
        record: "#3a4d53"
        list: "#3a4d53"
        block: "#3a4d53"
        hints: "#d5cdb6"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c44392"
        shape_bool: "#00978a"
        shape_int: "#c44392"
        shape_float: "#c44392"
        shape_range: "#a78300"
        shape_internalcall: "#00978a"
        shape_external: "#009c8f"
        shape_externalarg: "#428b00"
        shape_literal: "#0072d4"
        shape_operator: "#ad8900"
        shape_signature: "#428b00"
        shape_string: "#489100"
        shape_string_interpolation: "#00978a"
        shape_datetime: "#00978a"
        shape_list: "#00978a"
        shape_table: "#006dce"
        shape_record: "#00978a"
        shape_block: "#006dce"
        shape_filepath: "#009c8f"
        shape_globpattern: "#00978a"
        shape_variable: "#ca4898"
        shape_flag: "#006dce"
        shape_custom: "#489100"
        shape_nothing: "#00978a"
    }
}
