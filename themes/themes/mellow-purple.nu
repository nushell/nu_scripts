export def main [] {
    # extra desired values for the mellow_purple theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1e0528"
    # foreground: "#ffeeff"
    # cursor: "#ffeeff"

    {
        # color for nushell primitives
        separator: "#f8c0ff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#05cb0d"
        empty: "#550068"
        bool: "#f8c0ff"
        int: "#f8c0ff"
        filesize: "#f8c0ff"
        duration: "#f8c0ff"
        date: "#f8c0ff"
        range: "#f8c0ff"
        float: "#f8c0ff"
        string: "#f8c0ff"
        nothing: "#f8c0ff"
        binary: "#f8c0ff"
        cellpath: "#f8c0ff"
        row_index: "#05cb0d"
        record: "#f8c0ff"
        list: "#f8c0ff"
        block: "#f8c0ff"
        hints: "#320f55"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8991bb"
        shape_bool: "#b900b1"
        shape_int: "#8991bb"
        shape_float: "#8991bb"
        shape_range: "#955ae7"
        shape_internalcall: "#b900b1"
        shape_external: "#b900b1"
        shape_externalarg: "#05cb0d"
        shape_literal: "#550068"
        shape_operator: "#955ae7"
        shape_signature: "#05cb0d"
        shape_string: "#05cb0d"
        shape_string_interpolation: "#b900b1"
        shape_datetime: "#b900b1"
        shape_list: "#b900b1"
        shape_table: "#550068"
        shape_record: "#b900b1"
        shape_block: "#550068"
        shape_filepath: "#b900b1"
        shape_globpattern: "#b900b1"
        shape_variable: "#8991bb"
        shape_flag: "#550068"
        shape_custom: "#05cb0d"
        shape_nothing: "#b900b1"
    }
}
