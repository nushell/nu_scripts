export def main [] {
    # extra desired values for the brewer theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0c0d0e"
    # foreground: "#b7b8b9"
    # cursor: "#b7b8b9"

    {
        # color for nushell primitives
        separator: "#fcfdfe"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#31a354"
        empty: "#3182bd"
        bool: "#fcfdfe"
        int: "#fcfdfe"
        filesize: "#fcfdfe"
        duration: "#fcfdfe"
        date: "#fcfdfe"
        range: "#fcfdfe"
        float: "#fcfdfe"
        string: "#fcfdfe"
        nothing: "#fcfdfe"
        binary: "#fcfdfe"
        cellpath: "#fcfdfe"
        row_index: "#31a354"
        record: "#fcfdfe"
        list: "#fcfdfe"
        block: "#fcfdfe"
        hints: "#737475"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#756bb1"
        shape_bool: "#80b1d3"
        shape_int: "#756bb1"
        shape_float: "#756bb1"
        shape_range: "#dca060"
        shape_internalcall: "#80b1d3"
        shape_external: "#80b1d3"
        shape_externalarg: "#31a354"
        shape_literal: "#3182bd"
        shape_operator: "#dca060"
        shape_signature: "#31a354"
        shape_string: "#31a354"
        shape_string_interpolation: "#80b1d3"
        shape_datetime: "#80b1d3"
        shape_list: "#80b1d3"
        shape_table: "#3182bd"
        shape_record: "#80b1d3"
        shape_block: "#3182bd"
        shape_filepath: "#80b1d3"
        shape_globpattern: "#80b1d3"
        shape_variable: "#756bb1"
        shape_flag: "#3182bd"
        shape_custom: "#31a354"
        shape_nothing: "#80b1d3"
    }
}
