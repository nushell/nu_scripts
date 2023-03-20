export def main [] {
    # extra desired values for the hopscotch theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#322931"
    # foreground: "#b9b5b8"
    # cursor: "#b9b5b8"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8fc13e"
        empty: "#1290bf"
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
        row_index: "#8fc13e"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#797379"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c85e7c"
        shape_bool: "#149b93"
        shape_int: "#c85e7c"
        shape_float: "#c85e7c"
        shape_range: "#fdcc59"
        shape_internalcall: "#149b93"
        shape_external: "#149b93"
        shape_externalarg: "#8fc13e"
        shape_literal: "#1290bf"
        shape_operator: "#fdcc59"
        shape_signature: "#8fc13e"
        shape_string: "#8fc13e"
        shape_string_interpolation: "#149b93"
        shape_datetime: "#149b93"
        shape_list: "#149b93"
        shape_table: "#1290bf"
        shape_record: "#149b93"
        shape_block: "#1290bf"
        shape_filepath: "#149b93"
        shape_globpattern: "#149b93"
        shape_variable: "#c85e7c"
        shape_flag: "#1290bf"
        shape_custom: "#8fc13e"
        shape_nothing: "#149b93"
    }
}
