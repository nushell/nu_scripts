export def main [] {
    # extra desired values for the palmtree theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#282a36"
    # foreground: "#b043d1"
    # cursor: "#3fdcee"

    {
        # color for nushell primitives
        separator: "#bebec1"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#18e3c8"
        empty: "#8897f4"
        bool: "#bebec1"
        int: "#bebec1"
        filesize: "#bebec1"
        duration: "#bebec1"
        date: "#bebec1"
        range: "#bebec1"
        float: "#bebec1"
        string: "#bebec1"
        nothing: "#bebec1"
        binary: "#bebec1"
        cellpath: "#bebec1"
        row_index: "#18e3c8"
        record: "#bebec1"
        list: "#bebec1"
        block: "#bebec1"
        hints: "#666979"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b043d1"
        shape_bool: "#3fdcee"
        shape_int: "#b043d1"
        shape_float: "#b043d1"
        shape_range: "#ff8037"
        shape_internalcall: "#3fdcee"
        shape_external: "#79e6f3"
        shape_externalarg: "#18e3c8"
        shape_literal: "#8897f4"
        shape_operator: "#f2a272"
        shape_signature: "#18e3c8"
        shape_string: "#5adecd"
        shape_string_interpolation: "#3fdcee"
        shape_datetime: "#3fdcee"
        shape_list: "#3fdcee"
        shape_table: "#556fff"
        shape_record: "#3fdcee"
        shape_block: "#556fff"
        shape_filepath: "#79e6f3"
        shape_globpattern: "#3fdcee"
        shape_variable: "#c574dd"
        shape_flag: "#556fff"
        shape_custom: "#5adecd"
        shape_nothing: "#3fdcee"
    }
}
