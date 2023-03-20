export def main [] {
    # extra desired values for the snow_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#fbffff"
    # foreground: "#535c65"
    # cursor: "#434951"

    {
        # color for nushell primitives
        separator: "#434951"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#4d7f43"
        empty: "#2b7ab2"
        bool: "#434951"
        int: "#434951"
        filesize: "#434951"
        duration: "#434951"
        date: "#434951"
        range: "#434951"
        float: "#434951"
        string: "#434951"
        nothing: "#434951"
        binary: "#434951"
        cellpath: "#434951"
        row_index: "#4d7f43"
        record: "#434951"
        list: "#434951"
        block: "#434951"
        hints: "#6d7782"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8f63a2"
        shape_bool: "#008483"
        shape_int: "#8f63a2"
        shape_float: "#8f63a2"
        shape_range: "#906c33"
        shape_internalcall: "#008483"
        shape_external: "#008483"
        shape_externalarg: "#4d7f43"
        shape_literal: "#2b7ab2"
        shape_operator: "#906c33"
        shape_signature: "#4d7f43"
        shape_string: "#4d7f43"
        shape_string_interpolation: "#008483"
        shape_datetime: "#008483"
        shape_list: "#008483"
        shape_table: "#2b7ab2"
        shape_record: "#008483"
        shape_block: "#2b7ab2"
        shape_filepath: "#008483"
        shape_globpattern: "#008483"
        shape_variable: "#8f63a2"
        shape_flag: "#2b7ab2"
        shape_custom: "#4d7f43"
        shape_nothing: "#008483"
    }
}
