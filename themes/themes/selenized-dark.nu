export def main [] {
    # extra desired values for the selenized_dark theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#103c48"
    # foreground: "#adbcbc"
    # cursor: "#adbcbc"

    {
        # color for nushell primitives
        separator: "#cad8d9"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#84c747"
        empty: "#4695f7"
        bool: "#cad8d9"
        int: "#cad8d9"
        filesize: "#cad8d9"
        duration: "#cad8d9"
        date: "#cad8d9"
        range: "#cad8d9"
        float: "#cad8d9"
        string: "#cad8d9"
        nothing: "#cad8d9"
        binary: "#cad8d9"
        cellpath: "#cad8d9"
        row_index: "#84c747"
        record: "#cad8d9"
        list: "#cad8d9"
        block: "#cad8d9"
        hints: "#2d5b69"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff84cd"
        shape_bool: "#53d6c7"
        shape_int: "#ff84cd"
        shape_float: "#ff84cd"
        shape_range: "#ebc13d"
        shape_internalcall: "#53d6c7"
        shape_external: "#41c7b9"
        shape_externalarg: "#84c747"
        shape_literal: "#4695f7"
        shape_operator: "#dbb32d"
        shape_signature: "#84c747"
        shape_string: "#75b938"
        shape_string_interpolation: "#53d6c7"
        shape_datetime: "#53d6c7"
        shape_list: "#53d6c7"
        shape_table: "#58a3ff"
        shape_record: "#53d6c7"
        shape_block: "#58a3ff"
        shape_filepath: "#41c7b9"
        shape_globpattern: "#53d6c7"
        shape_variable: "#f275be"
        shape_flag: "#58a3ff"
        shape_custom: "#75b938"
        shape_nothing: "#53d6c7"
    }
}
