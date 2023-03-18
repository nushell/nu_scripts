export def main [] {
    # extra desired values for the sea_shells theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#09141b"
    # foreground: "#deb88d"
    # cursor: "#deb88d"

    {
        # color for nushell primitives
        separator: "#fee4ce"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#628d98"
        empty: "#1e4950"
        bool: "#fee4ce"
        int: "#fee4ce"
        filesize: "#fee4ce"
        duration: "#fee4ce"
        date: "#fee4ce"
        range: "#fee4ce"
        float: "#fee4ce"
        string: "#fee4ce"
        nothing: "#fee4ce"
        binary: "#fee4ce"
        cellpath: "#fee4ce"
        row_index: "#628d98"
        record: "#fee4ce"
        list: "#fee4ce"
        block: "#fee4ce"
        hints: "#434b53"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#bbe3ee"
        shape_bool: "#87acb4"
        shape_int: "#bbe3ee"
        shape_float: "#bbe3ee"
        shape_range: "#fdd39f"
        shape_internalcall: "#87acb4"
        shape_external: "#50a3b5"
        shape_externalarg: "#628d98"
        shape_literal: "#1e4950"
        shape_operator: "#fca02f"
        shape_signature: "#628d98"
        shape_string: "#027c9b"
        shape_string_interpolation: "#87acb4"
        shape_datetime: "#87acb4"
        shape_list: "#87acb4"
        shape_table: "#1bbcdd"
        shape_record: "#87acb4"
        shape_block: "#1bbcdd"
        shape_filepath: "#50a3b5"
        shape_globpattern: "#87acb4"
        shape_variable: "#68d4f1"
        shape_flag: "#1bbcdd"
        shape_custom: "#027c9b"
        shape_nothing: "#87acb4"
    }
}
