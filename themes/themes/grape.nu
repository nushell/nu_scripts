export def main [] {
    # extra desired values for the grape theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#171423"
    # foreground: "#9f9fa1"
    # cursor: "#9f9fa1"

    {
        # color for nushell primitives
        separator: "#a288f7"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#53aa5e"
        empty: "#487df4"
        bool: "#a288f7"
        int: "#a288f7"
        filesize: "#a288f7"
        duration: "#a288f7"
        date: "#a288f7"
        range: "#a288f7"
        float: "#a288f7"
        string: "#a288f7"
        nothing: "#a288f7"
        binary: "#a288f7"
        cellpath: "#a288f7"
        row_index: "#53aa5e"
        record: "#a288f7"
        list: "#a288f7"
        block: "#a288f7"
        hints: "#59516a"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#ad81c2"
        shape_bool: "#9de3eb"
        shape_int: "#ad81c2"
        shape_float: "#ad81c2"
        shape_range: "#b2dc87"
        shape_internalcall: "#9de3eb"
        shape_external: "#3bdeed"
        shape_externalarg: "#53aa5e"
        shape_literal: "#487df4"
        shape_operator: "#8ddc20"
        shape_signature: "#53aa5e"
        shape_string: "#1fa91b"
        shape_string_interpolation: "#9de3eb"
        shape_datetime: "#9de3eb"
        shape_list: "#9de3eb"
        shape_table: "#a9bcec"
        shape_record: "#9de3eb"
        shape_block: "#a9bcec"
        shape_filepath: "#3bdeed"
        shape_globpattern: "#9de3eb"
        shape_variable: "#8d35c9"
        shape_flag: "#a9bcec"
        shape_custom: "#1fa91b"
        shape_nothing: "#9de3eb"
    }
}
