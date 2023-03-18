export def main [] {
    # extra desired values for the nighty theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2f2f2f"
    # foreground: "#dfdfdf"
    # cursor: "#dfdfdf"

    {
        # color for nushell primitives
        separator: "#dfdfdf"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#119955"
        empty: "#1d3e6f"
        bool: "#dfdfdf"
        int: "#dfdfdf"
        filesize: "#dfdfdf"
        duration: "#dfdfdf"
        date: "#dfdfdf"
        range: "#dfdfdf"
        float: "#dfdfdf"
        string: "#dfdfdf"
        nothing: "#dfdfdf"
        binary: "#dfdfdf"
        cellpath: "#dfdfdf"
        row_index: "#119955"
        record: "#dfdfdf"
        list: "#dfdfdf"
        block: "#dfdfdf"
        hints: "#5c6370"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ed86c9"
        shape_bool: "#70d2a4"
        shape_int: "#ed86c9"
        shape_float: "#ed86c9"
        shape_range: "#dfe048"
        shape_internalcall: "#70d2a4"
        shape_external: "#3a7458"
        shape_externalarg: "#119955"
        shape_literal: "#1d3e6f"
        shape_operator: "#808020"
        shape_signature: "#119955"
        shape_string: "#095b32"
        shape_string_interpolation: "#70d2a4"
        shape_datetime: "#70d2a4"
        shape_list: "#70d2a4"
        shape_table: "#4674b8"
        shape_record: "#70d2a4"
        shape_block: "#4674b8"
        shape_filepath: "#3a7458"
        shape_globpattern: "#70d2a4"
        shape_variable: "#823065"
        shape_flag: "#4674b8"
        shape_custom: "#095b32"
        shape_nothing: "#70d2a4"
    }
}
