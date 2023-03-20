export def main [] {
    # extra desired values for the spacegray_eighties theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#222222"
    # foreground: "#bdbaae"
    # cursor: "#bdbaae"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#93d493"
        empty: "#5486c0"
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
        row_index: "#93d493"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#555555"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff55ff"
        shape_bool: "#83e9e4"
        shape_int: "#ff55ff"
        shape_float: "#ff55ff"
        shape_range: "#ffd256"
        shape_internalcall: "#83e9e4"
        shape_external: "#57c2c1"
        shape_externalarg: "#93d493"
        shape_literal: "#5486c0"
        shape_operator: "#fec254"
        shape_signature: "#93d493"
        shape_string: "#81a764"
        shape_string_interpolation: "#83e9e4"
        shape_datetime: "#83e9e4"
        shape_list: "#83e9e4"
        shape_table: "#4d84d1"
        shape_record: "#83e9e4"
        shape_block: "#4d84d1"
        shape_filepath: "#57c2c1"
        shape_globpattern: "#83e9e4"
        shape_variable: "#bf83c1"
        shape_flag: "#4d84d1"
        shape_custom: "#81a764"
        shape_nothing: "#83e9e4"
    }
}
