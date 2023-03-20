export def main [] {
    # extra desired values for the nightlion_v2 theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#171717"
    # foreground: "#bbbbbb"
    # cursor: "#bbbbbb"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7df71d"
        empty: "#64d0f0"
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
        row_index: "#7df71d"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#555555"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ff9bf5"
        shape_bool: "#00ccd8"
        shape_int: "#ff9bf5"
        shape_float: "#ff9bf5"
        shape_range: "#ffff55"
        shape_internalcall: "#00ccd8"
        shape_external: "#00dadf"
        shape_externalarg: "#7df71d"
        shape_literal: "#64d0f0"
        shape_operator: "#f3f167"
        shape_signature: "#7df71d"
        shape_string: "#04f623"
        shape_string_interpolation: "#00ccd8"
        shape_datetime: "#00ccd8"
        shape_list: "#00ccd8"
        shape_table: "#62cbe8"
        shape_record: "#00ccd8"
        shape_block: "#62cbe8"
        shape_filepath: "#00dadf"
        shape_globpattern: "#00ccd8"
        shape_variable: "#ce6fdb"
        shape_flag: "#62cbe8"
        shape_custom: "#04f623"
        shape_nothing: "#00ccd8"
    }
}
