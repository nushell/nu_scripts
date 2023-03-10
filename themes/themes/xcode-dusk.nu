export def main [] {
    # extra desired values for the xcode_dusk theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#282b35"
    # foreground: "#939599"
    # cursor: "#939599"

    {
        # color for nushell primitives
        separator: "#bebfc2"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#df0002"
        empty: "#790ead"
        bool: "#bebfc2"
        int: "#bebfc2"
        filesize: "#bebfc2"
        duration: "#bebfc2"
        date: "#bebfc2"
        range: "#bebfc2"
        float: "#bebfc2"
        string: "#bebfc2"
        nothing: "#bebfc2"
        binary: "#bebfc2"
        cellpath: "#bebfc2"
        row_index: "#df0002"
        record: "#bebfc2"
        list: "#bebfc2"
        block: "#bebfc2"
        hints: "#686a71"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b21889"
        shape_bool: "#00a0be"
        shape_int: "#b21889"
        shape_float: "#b21889"
        shape_range: "#438288"
        shape_internalcall: "#00a0be"
        shape_external: "#00a0be"
        shape_externalarg: "#df0002"
        shape_literal: "#790ead"
        shape_operator: "#438288"
        shape_signature: "#df0002"
        shape_string: "#df0002"
        shape_string_interpolation: "#00a0be"
        shape_datetime: "#00a0be"
        shape_list: "#00a0be"
        shape_table: "#790ead"
        shape_record: "#00a0be"
        shape_block: "#790ead"
        shape_filepath: "#00a0be"
        shape_globpattern: "#00a0be"
        shape_variable: "#b21889"
        shape_flag: "#790ead"
        shape_custom: "#df0002"
        shape_nothing: "#00a0be"
    }
}
