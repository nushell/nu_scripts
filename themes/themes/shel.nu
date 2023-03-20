export def main [] {
    # extra desired values for the shel theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#2a201f"
    # foreground: "#4882cd"
    # cursor: "#4882cd"

    {
        # color for nushell primitives
        separator: "#f5eeec"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#c2ee86"
        empty: "#2c64a2"
        bool: "#f5eeec"
        int: "#f5eeec"
        filesize: "#f5eeec"
        duration: "#f5eeec"
        date: "#f5eeec"
        range: "#f5eeec"
        float: "#f5eeec"
        string: "#f5eeec"
        nothing: "#f5eeec"
        binary: "#f5eeec"
        cellpath: "#f5eeec"
        row_index: "#c2ee86"
        record: "#f5eeec"
        list: "#f5eeec"
        block: "#f5eeec"
        hints: "#918988"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#c288ec"
        shape_bool: "#8feeb9"
        shape_int: "#c288ec"
        shape_float: "#c288ec"
        shape_range: "#f5ba86"
        shape_internalcall: "#8feeb9"
        shape_external: "#2ca363"
        shape_externalarg: "#c2ee86"
        shape_literal: "#2c64a2"
        shape_operator: "#ab6423"
        shape_signature: "#c2ee86"
        shape_string: "#6ca323"
        shape_string_interpolation: "#8feeb9"
        shape_datetime: "#8feeb9"
        shape_list: "#8feeb9"
        shape_table: "#8fbaec"
        shape_record: "#8feeb9"
        shape_block: "#8fbaec"
        shape_filepath: "#2ca363"
        shape_globpattern: "#8feeb9"
        shape_variable: "#6c24a2"
        shape_flag: "#8fbaec"
        shape_custom: "#6ca323"
        shape_nothing: "#8feeb9"
    }
}
