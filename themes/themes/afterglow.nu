export def main [] {
    # extra desired values for the afterglow theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#222222"
    # foreground: "#d0d0d0"
    # cursor: "#d0d0d0"

    {
        # color for nushell primitives
        separator: "#f5f5f5"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7b9246"
        empty: "#6c99bb"
        bool: "#f5f5f5"
        int: "#f5f5f5"
        filesize: "#f5f5f5"
        duration: "#f5f5f5"
        date: "#f5f5f5"
        range: "#f5f5f5"
        float: "#f5f5f5"
        string: "#f5f5f5"
        nothing: "#f5f5f5"
        binary: "#f5f5f5"
        cellpath: "#f5f5f5"
        row_index: "#7b9246"
        record: "#f5f5f5"
        list: "#f5f5f5"
        block: "#f5f5f5"
        hints: "#505050"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#9f4e85"
        shape_bool: "#7dd6cf"
        shape_int: "#9f4e85"
        shape_float: "#9f4e85"
        shape_range: "#d3a04d"
        shape_internalcall: "#7dd6cf"
        shape_external: "#7dd6cf"
        shape_externalarg: "#7b9246"
        shape_literal: "#6c99bb"
        shape_operator: "#d3a04d"
        shape_signature: "#7b9246"
        shape_string: "#7b9246"
        shape_string_interpolation: "#7dd6cf"
        shape_datetime: "#7dd6cf"
        shape_list: "#7dd6cf"
        shape_table: "#547c99"
        shape_record: "#7dd6cf"
        shape_block: "#547c99"
        shape_filepath: "#7dd6cf"
        shape_globpattern: "#7dd6cf"
        shape_variable: "#9f4e85"
        shape_flag: "#547c99"
        shape_custom: "#7b9246"
        shape_nothing: "#7dd6cf"
    }
}
