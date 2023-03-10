export def main [] {
    # extra desired values for the vs_code-dark-plus theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1e1e1e"
    # foreground: "#cccccc"
    # cursor: "#cccccc"

    {
        # color for nushell primitives
        separator: "#d9fbff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#00ff9a"
        empty: "#44aae6"
        bool: "#d9fbff"
        int: "#d9fbff"
        filesize: "#d9fbff"
        duration: "#d9fbff"
        date: "#d9fbff"
        range: "#d9fbff"
        float: "#d9fbff"
        string: "#d9fbff"
        nothing: "#d9fbff"
        binary: "#d9fbff"
        cellpath: "#d9fbff"
        row_index: "#00ff9a"
        record: "#d9fbff"
        list: "#d9fbff"
        block: "#d9fbff"
        hints: "#598489"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff578f"
        shape_bool: "#5fffff"
        shape_int: "#ff578f"
        shape_float: "#ff578f"
        shape_range: "#e89440"
        shape_internalcall: "#5fffff"
        shape_external: "#3dd5e7"
        shape_externalarg: "#00ff9a"
        shape_literal: "#44aae6"
        shape_operator: "#e5b684"
        shape_signature: "#00ff9a"
        shape_string: "#39e9a8"
        shape_string_interpolation: "#5fffff"
        shape_datetime: "#5fffff"
        shape_list: "#5fffff"
        shape_table: "#009afb"
        shape_record: "#5fffff"
        shape_block: "#009afb"
        shape_filepath: "#3dd5e7"
        shape_globpattern: "#5fffff"
        shape_variable: "#e17599"
        shape_flag: "#009afb"
        shape_custom: "#39e9a8"
        shape_nothing: "#5fffff"
    }
}
