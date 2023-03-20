export def main [] {
    # extra desired values for the dimmed_monokai theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#1f1f1f"
    # foreground: "#b9bcba"
    # cursor: "#b9bcba"

    {
        # color for nushell primitives
        separator: "#fdffb9"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#0f722f"
        empty: "#4f76a1"
        bool: "#fdffb9"
        int: "#fdffb9"
        filesize: "#fdffb9"
        duration: "#fdffb9"
        date: "#fdffb9"
        range: "#fdffb9"
        float: "#fdffb9"
        string: "#fdffb9"
        nothing: "#fdffb9"
        binary: "#fdffb9"
        cellpath: "#fdffb9"
        row_index: "#0f722f"
        record: "#fdffb9"
        list: "#fdffb9"
        block: "#fdffb9"
        hints: "#888987"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#fb0067"
        shape_bool: "#2e706d"
        shape_int: "#fb0067"
        shape_float: "#fb0067"
        shape_range: "#c47033"
        shape_internalcall: "#2e706d"
        shape_external: "#578fa4"
        shape_externalarg: "#0f722f"
        shape_literal: "#4f76a1"
        shape_operator: "#c5a635"
        shape_signature: "#0f722f"
        shape_string: "#879a3b"
        shape_string_interpolation: "#2e706d"
        shape_datetime: "#2e706d"
        shape_list: "#2e706d"
        shape_table: "#186de3"
        shape_record: "#2e706d"
        shape_block: "#186de3"
        shape_filepath: "#578fa4"
        shape_globpattern: "#2e706d"
        shape_variable: "#855c8d"
        shape_flag: "#186de3"
        shape_custom: "#879a3b"
        shape_nothing: "#2e706d"
    }
}
