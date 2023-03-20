export def main [] {
    # extra desired values for the solarized_dark-higher-contrast theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#001e27"
    # foreground: "#9cc2c3"
    # cursor: "#9cc2c3"

    {
        # color for nushell primitives
        separator: "#fcf4dc"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#51ef84"
        empty: "#2176c7"
        bool: "#fcf4dc"
        int: "#fcf4dc"
        filesize: "#fcf4dc"
        duration: "#fcf4dc"
        date: "#fcf4dc"
        range: "#fcf4dc"
        float: "#fcf4dc"
        string: "#fcf4dc"
        nothing: "#fcf4dc"
        binary: "#fcf4dc"
        cellpath: "#fcf4dc"
        row_index: "#51ef84"
        record: "#fcf4dc"
        list: "#fcf4dc"
        block: "#fcf4dc"
        hints: "#006488"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#e24d8e"
        shape_bool: "#00b39e"
        shape_int: "#e24d8e"
        shape_float: "#e24d8e"
        shape_range: "#b27e28"
        shape_internalcall: "#00b39e"
        shape_external: "#259286"
        shape_externalarg: "#51ef84"
        shape_literal: "#2176c7"
        shape_operator: "#a57706"
        shape_signature: "#51ef84"
        shape_string: "#6cbe6c"
        shape_string_interpolation: "#00b39e"
        shape_datetime: "#00b39e"
        shape_list: "#00b39e"
        shape_table: "#178ec8"
        shape_record: "#00b39e"
        shape_block: "#178ec8"
        shape_filepath: "#259286"
        shape_globpattern: "#00b39e"
        shape_variable: "#c61c6f"
        shape_flag: "#178ec8"
        shape_custom: "#6cbe6c"
        shape_nothing: "#00b39e"
    }
}
