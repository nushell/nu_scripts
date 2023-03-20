export def main [] {
    # extra desired values for the miramare theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2a2426"
    # foreground: "#e6d6ac"
    # cursor: "#d9bb80"

    {
        # color for nushell primitives
        separator: "#444444"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#87af87"
        empty: "#89beba"
        bool: "#444444"
        int: "#444444"
        filesize: "#444444"
        duration: "#444444"
        date: "#444444"
        range: "#444444"
        float: "#444444"
        string: "#444444"
        nothing: "#444444"
        binary: "#444444"
        cellpath: "#444444"
        row_index: "#87af87"
        record: "#444444"
        list: "#444444"
        block: "#444444"
        hints: "#e6d6ac"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#d3a0bc"
        shape_bool: "#87c095"
        shape_int: "#d3a0bc"
        shape_float: "#d3a0bc"
        shape_range: "#d9bb80"
        shape_internalcall: "#87c095"
        shape_external: "#87c095"
        shape_externalarg: "#87af87"
        shape_literal: "#89beba"
        shape_operator: "#d9bb80"
        shape_signature: "#87af87"
        shape_string: "#87af87"
        shape_string_interpolation: "#87c095"
        shape_datetime: "#87c095"
        shape_list: "#87c095"
        shape_table: "#89beba"
        shape_record: "#87c095"
        shape_block: "#89beba"
        shape_filepath: "#87c095"
        shape_globpattern: "#87c095"
        shape_variable: "#d3a0bc"
        shape_flag: "#89beba"
        shape_custom: "#87af87"
        shape_nothing: "#87c095"
    }
}
