export def main [] {
    # extra desired values for the aci theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#0d1926"
    # foreground: "#b4e1fd"
    # cursor: "#b4e1fd"

    {
        # color for nushell primitives
        separator: "#c2c2c2"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#8eff1e"
        empty: "#0883ff"
        bool: "#c2c2c2"
        int: "#c2c2c2"
        filesize: "#c2c2c2"
        duration: "#c2c2c2"
        date: "#c2c2c2"
        range: "#c2c2c2"
        float: "#c2c2c2"
        string: "#c2c2c2"
        nothing: "#c2c2c2"
        binary: "#c2c2c2"
        cellpath: "#c2c2c2"
        row_index: "#8eff1e"
        record: "#c2c2c2"
        list: "#c2c2c2"
        block: "#c2c2c2"
        hints: "#424242"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#8e1eff"
        shape_bool: "#1eff8e"
        shape_int: "#8e1eff"
        shape_float: "#8e1eff"
        shape_range: "#ff8e1e"
        shape_internalcall: "#1eff8e"
        shape_external: "#08ff83"
        shape_externalarg: "#8eff1e"
        shape_literal: "#0883ff"
        shape_operator: "#ff8308"
        shape_signature: "#8eff1e"
        shape_string: "#83ff08"
        shape_string_interpolation: "#1eff8e"
        shape_datetime: "#1eff8e"
        shape_list: "#1eff8e"
        shape_table: "#1e8eff"
        shape_record: "#1eff8e"
        shape_block: "#1e8eff"
        shape_filepath: "#08ff83"
        shape_globpattern: "#1eff8e"
        shape_variable: "#8308ff"
        shape_flag: "#1e8eff"
        shape_custom: "#83ff08"
        shape_nothing: "#1eff8e"
    }
}
