export def main [] {
    # extra desired values for the sundried theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1a1818"
    # foreground: "#c9c9c9"
    # cursor: "#c9c9c9"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#128c21"
        empty: "#485b98"
        bool: "#ffffff"
        int: "#ffffff"
        filesize: "#ffffff"
        duration: "#ffffff"
        date: "#ffffff"
        range: "#ffffff"
        float: "#ffffff"
        string: "#ffffff"
        nothing: "#ffffff"
        binary: "#ffffff"
        cellpath: "#ffffff"
        row_index: "#128c21"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#4d4e48"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#fd8aa1"
        shape_bool: "#fad484"
        shape_int: "#fd8aa1"
        shape_float: "#fd8aa1"
        shape_range: "#fc6a21"
        shape_internalcall: "#fad484"
        shape_external: "#9c814f"
        shape_externalarg: "#128c21"
        shape_literal: "#485b98"
        shape_operator: "#9d602a"
        shape_signature: "#128c21"
        shape_string: "#587744"
        shape_string_interpolation: "#fad484"
        shape_datetime: "#fad484"
        shape_list: "#fad484"
        shape_table: "#7999f7"
        shape_record: "#fad484"
        shape_block: "#7999f7"
        shape_filepath: "#9c814f"
        shape_globpattern: "#fad484"
        shape_variable: "#864651"
        shape_flag: "#7999f7"
        shape_custom: "#587744"
        shape_nothing: "#fad484"
    }
}
