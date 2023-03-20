export def main [] {
    # extra desired values for the atelier_sulphurpool-light theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#f5f7ff"
    # foreground: "#5e6687"
    # cursor: "#5e6687"

    {
        # color for nushell primitives
        separator: "#202746"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#ac9739"
        empty: "#3d8fd1"
        bool: "#202746"
        int: "#202746"
        filesize: "#202746"
        duration: "#202746"
        date: "#202746"
        range: "#202746"
        float: "#202746"
        string: "#202746"
        nothing: "#202746"
        binary: "#202746"
        cellpath: "#202746"
        row_index: "#ac9739"
        record: "#202746"
        list: "#202746"
        block: "#202746"
        hints: "#898ea4"

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
