export def main [] {
    # extra desired values for the mountaineer theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#050505"
    # foreground: "#f0f0f0"
    # cursor: "#b5bd68"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#b5bd68"
        empty: "#81a2be"
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
        row_index: "#b5bd68"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#969896"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b294bb"
        shape_bool: "#8abeb7"
        shape_int: "#b294bb"
        shape_float: "#b294bb"
        shape_range: "#f0c674"
        shape_internalcall: "#8abeb7"
        shape_external: "#8abeb7"
        shape_externalarg: "#b5bd68"
        shape_literal: "#81a2be"
        shape_operator: "#f0c674"
        shape_signature: "#b5bd68"
        shape_string: "#b5bd68"
        shape_string_interpolation: "#8abeb7"
        shape_datetime: "#8abeb7"
        shape_list: "#8abeb7"
        shape_table: "#81a2be"
        shape_record: "#8abeb7"
        shape_block: "#81a2be"
        shape_filepath: "#8abeb7"
        shape_globpattern: "#8abeb7"
        shape_variable: "#b294bb"
        shape_flag: "#81a2be"
        shape_custom: "#b5bd68"
        shape_nothing: "#8abeb7"
    }
}
