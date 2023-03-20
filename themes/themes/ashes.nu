export def main [] {
    # extra desired values for the ashes theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1c2023"
    # foreground: "#c7ccd1"
    # cursor: "#c7ccd1"

    {
        # color for nushell primitives
        separator: "#f3f4f5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#95c7ae"
        empty: "#ae95c7"
        bool: "#f3f4f5"
        int: "#f3f4f5"
        filesize: "#f3f4f5"
        duration: "#f3f4f5"
        date: "#f3f4f5"
        range: "#f3f4f5"
        float: "#f3f4f5"
        string: "#f3f4f5"
        nothing: "#f3f4f5"
        binary: "#f3f4f5"
        cellpath: "#f3f4f5"
        row_index: "#95c7ae"
        record: "#f3f4f5"
        list: "#f3f4f5"
        block: "#f3f4f5"
        hints: "#747c84"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c795ae"
        shape_bool: "#95aec7"
        shape_int: "#c795ae"
        shape_float: "#c795ae"
        shape_range: "#aec795"
        shape_internalcall: "#95aec7"
        shape_external: "#95aec7"
        shape_externalarg: "#95c7ae"
        shape_literal: "#ae95c7"
        shape_operator: "#aec795"
        shape_signature: "#95c7ae"
        shape_string: "#95c7ae"
        shape_string_interpolation: "#95aec7"
        shape_datetime: "#95aec7"
        shape_list: "#95aec7"
        shape_table: "#ae95c7"
        shape_record: "#95aec7"
        shape_block: "#ae95c7"
        shape_filepath: "#95aec7"
        shape_globpattern: "#95aec7"
        shape_variable: "#c795ae"
        shape_flag: "#ae95c7"
        shape_custom: "#95c7ae"
        shape_nothing: "#95aec7"
    }
}
