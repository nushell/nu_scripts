export def main [] {
    # extra desired values for the piatto_light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ffffff"
    # foreground: "#414141"
    # cursor: "#5e76c7"

    {
        # color for nushell primitives
        separator: "#f1f1f1"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#829428"
        empty: "#3b5ea7"
        bool: "#f1f1f1"
        int: "#f1f1f1"
        filesize: "#f1f1f1"
        duration: "#f1f1f1"
        date: "#f1f1f1"
        range: "#f1f1f1"
        float: "#f1f1f1"
        string: "#f1f1f1"
        nothing: "#f1f1f1"
        binary: "#f1f1f1"
        cellpath: "#f1f1f1"
        row_index: "#829428"
        record: "#f1f1f1"
        list: "#f1f1f1"
        block: "#f1f1f1"
        hints: "#3e3e3e"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#a353b2"
        shape_bool: "#829428"
        shape_int: "#a353b2"
        shape_float: "#a353b2"
        shape_range: "#cc6e33"
        shape_internalcall: "#829428"
        shape_external: "#66781d"
        shape_externalarg: "#829428"
        shape_literal: "#3b5ea7"
        shape_operator: "#cc6e33"
        shape_signature: "#829428"
        shape_string: "#66781d"
        shape_string_interpolation: "#829428"
        shape_datetime: "#829428"
        shape_list: "#829428"
        shape_table: "#3b5ea7"
        shape_record: "#829428"
        shape_block: "#3b5ea7"
        shape_filepath: "#66781d"
        shape_globpattern: "#829428"
        shape_variable: "#a353b2"
        shape_flag: "#3b5ea7"
        shape_custom: "#66781d"
        shape_nothing: "#829428"
    }
}
