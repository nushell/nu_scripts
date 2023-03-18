export def main [] {
    # extra desired values for the atelier_sulphurpool theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#202746"
    # foreground: "#979db4"
    # cursor: "#979db4"

    {
        # color for nushell primitives
        separator: "#f5f7ff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#ac9739"
        empty: "#3d8fd1"
        bool: "#f5f7ff"
        int: "#f5f7ff"
        filesize: "#f5f7ff"
        duration: "#f5f7ff"
        date: "#f5f7ff"
        range: "#f5f7ff"
        float: "#f5f7ff"
        string: "#f5f7ff"
        nothing: "#f5f7ff"
        binary: "#f5f7ff"
        cellpath: "#f5f7ff"
        row_index: "#ac9739"
        record: "#f5f7ff"
        list: "#f5f7ff"
        block: "#f5f7ff"
        hints: "#6b7394"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#6679cc"
        shape_bool: "#22a2c9"
        shape_int: "#6679cc"
        shape_float: "#6679cc"
        shape_range: "#c08b30"
        shape_internalcall: "#22a2c9"
        shape_external: "#22a2c9"
        shape_externalarg: "#ac9739"
        shape_literal: "#3d8fd1"
        shape_operator: "#c08b30"
        shape_signature: "#ac9739"
        shape_string: "#ac9739"
        shape_string_interpolation: "#22a2c9"
        shape_datetime: "#22a2c9"
        shape_list: "#22a2c9"
        shape_table: "#3d8fd1"
        shape_record: "#22a2c9"
        shape_block: "#3d8fd1"
        shape_filepath: "#22a2c9"
        shape_globpattern: "#22a2c9"
        shape_variable: "#6679cc"
        shape_flag: "#3d8fd1"
        shape_custom: "#ac9739"
        shape_nothing: "#22a2c9"
    }
}
