export def main [] {
    # extra desired values for the nightfly theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#011627"
    # foreground: "#c3ccdc"
    # cursor: "#82aaff"

    {
        # color for nushell primitives
        separator: "#d6deeb"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#21c7a8"
        empty: "#82aaff"
        bool: "#d6deeb"
        int: "#d6deeb"
        filesize: "#d6deeb"
        duration: "#d6deeb"
        date: "#d6deeb"
        range: "#d6deeb"
        float: "#d6deeb"
        string: "#d6deeb"
        nothing: "#d6deeb"
        binary: "#d6deeb"
        cellpath: "#d6deeb"
        row_index: "#21c7a8"
        record: "#d6deeb"
        list: "#d6deeb"
        block: "#d6deeb"
        hints: "#7c8f8f"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ae81ff"
        shape_bool: "#7fdbca"
        shape_int: "#ae81ff"
        shape_float: "#ae81ff"
        shape_range: "#ecc48d"
        shape_internalcall: "#7fdbca"
        shape_external: "#7fdbca"
        shape_externalarg: "#21c7a8"
        shape_literal: "#82aaff"
        shape_operator: "#e7d37a"
        shape_signature: "#21c7a8"
        shape_string: "#a1cd5e"
        shape_string_interpolation: "#7fdbca"
        shape_datetime: "#7fdbca"
        shape_list: "#7fdbca"
        shape_table: "#82aaff"
        shape_record: "#7fdbca"
        shape_block: "#82aaff"
        shape_filepath: "#7fdbca"
        shape_globpattern: "#7fdbca"
        shape_variable: "#c792ea"
        shape_flag: "#82aaff"
        shape_custom: "#a1cd5e"
        shape_nothing: "#7fdbca"
    }
}
