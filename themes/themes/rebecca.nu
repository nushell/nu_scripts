export def main [] {
    # extra desired values for the rebecca theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#292a44"
    # foreground: "#f1eff8"
    # cursor: "#f1eff8"

    {
        # color for nushell primitives
        separator: "#53495d"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#6dfedf"
        empty: "#2de0a7"
        bool: "#53495d"
        int: "#53495d"
        filesize: "#53495d"
        duration: "#53495d"
        date: "#53495d"
        range: "#53495d"
        float: "#53495d"
        string: "#53495d"
        nothing: "#53495d"
        binary: "#53495d"
        cellpath: "#53495d"
        row_index: "#6dfedf"
        record: "#53495d"
        list: "#53495d"
        block: "#53495d"
        hints: "#666699"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#7aa5ff"
        shape_bool: "#8eaee0"
        shape_int: "#7aa5ff"
        shape_float: "#7aa5ff"
        shape_range: "#ae81ff"
        shape_internalcall: "#8eaee0"
        shape_external: "#8eaee0"
        shape_externalarg: "#6dfedf"
        shape_literal: "#2de0a7"
        shape_operator: "#ae81ff"
        shape_signature: "#6dfedf"
        shape_string: "#6dfedf"
        shape_string_interpolation: "#8eaee0"
        shape_datetime: "#8eaee0"
        shape_list: "#8eaee0"
        shape_table: "#2de0a7"
        shape_record: "#8eaee0"
        shape_block: "#2de0a7"
        shape_filepath: "#8eaee0"
        shape_globpattern: "#8eaee0"
        shape_variable: "#7aa5ff"
        shape_flag: "#2de0a7"
        shape_custom: "#6dfedf"
        shape_nothing: "#8eaee0"
    }
}
