export def main [] {
    # extra desired values for the later_this-evening theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#222222"
    # foreground: "#959595"
    # cursor: "#959595"

    {
        # color for nushell primitives
        separator: "#c1c2c2"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#aabb39"
        empty: "#a0bad6"
        bool: "#c1c2c2"
        int: "#c1c2c2"
        filesize: "#c1c2c2"
        duration: "#c1c2c2"
        date: "#c1c2c2"
        range: "#c1c2c2"
        float: "#c1c2c2"
        string: "#c1c2c2"
        nothing: "#c1c2c2"
        binary: "#c1c2c2"
        cellpath: "#c1c2c2"
        row_index: "#aabb39"
        record: "#c1c2c2"
        list: "#c1c2c2"
        block: "#c1c2c2"
        hints: "#454747"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ab53d6"
        shape_bool: "#5fc0ae"
        shape_int: "#ab53d6"
        shape_float: "#ab53d6"
        shape_range: "#e5be39"
        shape_internalcall: "#5fc0ae"
        shape_external: "#91bfb7"
        shape_externalarg: "#aabb39"
        shape_literal: "#a0bad6"
        shape_operator: "#e5d289"
        shape_signature: "#aabb39"
        shape_string: "#afba67"
        shape_string_interpolation: "#5fc0ae"
        shape_datetime: "#5fc0ae"
        shape_list: "#5fc0ae"
        shape_table: "#6699d6"
        shape_record: "#5fc0ae"
        shape_block: "#6699d6"
        shape_filepath: "#91bfb7"
        shape_globpattern: "#5fc0ae"
        shape_variable: "#c092d6"
        shape_flag: "#6699d6"
        shape_custom: "#afba67"
        shape_nothing: "#5fc0ae"
    }
}
