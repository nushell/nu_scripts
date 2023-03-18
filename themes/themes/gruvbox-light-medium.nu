export def main [] {
    # extra desired values for the gruvbox_light-medium theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#fbf1c7"
    # foreground: "#504945"
    # cursor: "#504945"

    {
        # color for nushell primitives
        separator: "#282828"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#79740e"
        empty: "#076678"
        bool: "#282828"
        int: "#282828"
        filesize: "#282828"
        duration: "#282828"
        date: "#282828"
        range: "#282828"
        float: "#282828"
        string: "#282828"
        nothing: "#282828"
        binary: "#282828"
        cellpath: "#282828"
        row_index: "#79740e"
        record: "#282828"
        list: "#282828"
        block: "#282828"
        hints: "#bdae93"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8f3f71"
        shape_bool: "#427b58"
        shape_int: "#8f3f71"
        shape_float: "#8f3f71"
        shape_range: "#b57614"
        shape_internalcall: "#427b58"
        shape_external: "#427b58"
        shape_externalarg: "#79740e"
        shape_literal: "#076678"
        shape_operator: "#b57614"
        shape_signature: "#79740e"
        shape_string: "#79740e"
        shape_string_interpolation: "#427b58"
        shape_datetime: "#427b58"
        shape_list: "#427b58"
        shape_table: "#076678"
        shape_record: "#427b58"
        shape_block: "#076678"
        shape_filepath: "#427b58"
        shape_globpattern: "#427b58"
        shape_variable: "#8f3f71"
        shape_flag: "#076678"
        shape_custom: "#79740e"
        shape_nothing: "#427b58"
    }
}
