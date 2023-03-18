export def main [] {
    # extra desired values for the clone_of-ubuntu theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#300a24"
    # foreground: "#ffffff"
    # cursor: "#ffffff"

    {
        # color for nushell primitives
        separator: "#eeeeec"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8ae234"
        empty: "#3465a4"
        bool: "#eeeeec"
        int: "#eeeeec"
        filesize: "#eeeeec"
        duration: "#eeeeec"
        date: "#eeeeec"
        range: "#eeeeec"
        float: "#eeeeec"
        string: "#eeeeec"
        nothing: "#eeeeec"
        binary: "#eeeeec"
        cellpath: "#eeeeec"
        row_index: "#8ae234"
        record: "#eeeeec"
        list: "#eeeeec"
        block: "#eeeeec"
        hints: "#555753"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ad7fa8"
        shape_bool: "#34e2e2"
        shape_int: "#ad7fa8"
        shape_float: "#ad7fa8"
        shape_range: "#fce94f"
        shape_internalcall: "#34e2e2"
        shape_external: "#06989a"
        shape_externalarg: "#8ae234"
        shape_literal: "#3465a4"
        shape_operator: "#c4a000"
        shape_signature: "#8ae234"
        shape_string: "#4e9a06"
        shape_string_interpolation: "#34e2e2"
        shape_datetime: "#34e2e2"
        shape_list: "#34e2e2"
        shape_table: "#729fcf"
        shape_record: "#34e2e2"
        shape_block: "#729fcf"
        shape_filepath: "#06989a"
        shape_globpattern: "#34e2e2"
        shape_variable: "#75507b"
        shape_flag: "#729fcf"
        shape_custom: "#4e9a06"
        shape_nothing: "#34e2e2"
    }
}
