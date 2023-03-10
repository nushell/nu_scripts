export def main [] {
    # extra desired values for the fishtank theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#232537"
    # foreground: "#ecf0fe"
    # cursor: "#ecf0fe"

    {
        # color for nushell primitives
        separator: "#f6ffec"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#dbffa9"
        empty: "#525fb8"
        bool: "#f6ffec"
        int: "#f6ffec"
        filesize: "#f6ffec"
        duration: "#f6ffec"
        date: "#f6ffec"
        range: "#f6ffec"
        float: "#f6ffec"
        string: "#f6ffec"
        nothing: "#f6ffec"
        binary: "#f6ffec"
        cellpath: "#f6ffec"
        row_index: "#dbffa9"
        record: "#f6ffec"
        list: "#f6ffec"
        block: "#f6ffec"
        hints: "#6c5b30"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#fda5cd"
        shape_bool: "#a5bd86"
        shape_int: "#fda5cd"
        shape_float: "#fda5cd"
        shape_range: "#fee6a9"
        shape_internalcall: "#a5bd86"
        shape_external: "#968763"
        shape_externalarg: "#dbffa9"
        shape_literal: "#525fb8"
        shape_operator: "#fecd5e"
        shape_signature: "#dbffa9"
        shape_string: "#acf157"
        shape_string_interpolation: "#a5bd86"
        shape_datetime: "#a5bd86"
        shape_list: "#a5bd86"
        shape_table: "#b2befa"
        shape_record: "#a5bd86"
        shape_block: "#b2befa"
        shape_filepath: "#968763"
        shape_globpattern: "#a5bd86"
        shape_variable: "#986f82"
        shape_flag: "#b2befa"
        shape_custom: "#acf157"
        shape_nothing: "#a5bd86"
    }
}
