export def main [] {
    # extra desired values for the neon_night theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#20242d"
    # foreground: "#c7c8ff"
    # cursor: "#c7c8ff"

    {
        # color for nushell primitives
        separator: "#c9cccd"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#7efdd0"
        empty: "#69b4f9"
        bool: "#c9cccd"
        int: "#c9cccd"
        filesize: "#c9cccd"
        duration: "#c9cccd"
        date: "#c9cccd"
        range: "#c9cccd"
        float: "#c9cccd"
        string: "#c9cccd"
        nothing: "#c9cccd"
        binary: "#c9cccd"
        cellpath: "#c9cccd"
        row_index: "#7efdd0"
        record: "#c9cccd"
        list: "#c9cccd"
        block: "#c9cccd"
        hints: "#20242d"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#dd92f6"
        shape_bool: "#8ce8ff"
        shape_int: "#dd92f6"
        shape_float: "#dd92f6"
        shape_range: "#fcad3f"
        shape_internalcall: "#8ce8ff"
        shape_external: "#8ce8ff"
        shape_externalarg: "#7efdd0"
        shape_literal: "#69b4f9"
        shape_operator: "#fcad3f"
        shape_signature: "#7efdd0"
        shape_string: "#7efdd0"
        shape_string_interpolation: "#8ce8ff"
        shape_datetime: "#8ce8ff"
        shape_list: "#8ce8ff"
        shape_table: "#69b4f9"
        shape_record: "#8ce8ff"
        shape_block: "#69b4f9"
        shape_filepath: "#8ce8ff"
        shape_globpattern: "#8ce8ff"
        shape_variable: "#dd92f6"
        shape_flag: "#69b4f9"
        shape_custom: "#7efdd0"
        shape_nothing: "#8ce8ff"
    }
}
