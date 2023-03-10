export def main [] {
    # extra desired values for the neutron theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1c1e22"
    # foreground: "#e6e8ef"
    # cursor: "#e6e8ef"

    {
        # color for nushell primitives
        separator: "#ebedf2"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#5ab977"
        empty: "#6a7c93"
        bool: "#ebedf2"
        int: "#ebedf2"
        filesize: "#ebedf2"
        duration: "#ebedf2"
        date: "#ebedf2"
        range: "#ebedf2"
        float: "#ebedf2"
        string: "#ebedf2"
        nothing: "#ebedf2"
        binary: "#ebedf2"
        cellpath: "#ebedf2"
        row_index: "#5ab977"
        record: "#ebedf2"
        list: "#ebedf2"
        block: "#ebedf2"
        hints: "#23252b"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a4799d"
        shape_bool: "#3f94a8"
        shape_int: "#a4799d"
        shape_float: "#a4799d"
        shape_range: "#deb566"
        shape_internalcall: "#3f94a8"
        shape_external: "#3f94a8"
        shape_externalarg: "#5ab977"
        shape_literal: "#6a7c93"
        shape_operator: "#deb566"
        shape_signature: "#5ab977"
        shape_string: "#5ab977"
        shape_string_interpolation: "#3f94a8"
        shape_datetime: "#3f94a8"
        shape_list: "#3f94a8"
        shape_table: "#6a7c93"
        shape_record: "#3f94a8"
        shape_block: "#6a7c93"
        shape_filepath: "#3f94a8"
        shape_globpattern: "#3f94a8"
        shape_variable: "#a4799d"
        shape_flag: "#6a7c93"
        shape_custom: "#5ab977"
        shape_nothing: "#3f94a8"
    }
}
