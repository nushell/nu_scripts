export def main [] {
    # extra desired values for the atelier_dune theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#20201d"
    # foreground: "#a6a28c"
    # cursor: "#a6a28c"

    {
        # color for nushell primitives
        separator: "#fefbec"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#60ac39"
        empty: "#6684e1"
        bool: "#fefbec"
        int: "#fefbec"
        filesize: "#fefbec"
        duration: "#fefbec"
        date: "#fefbec"
        range: "#fefbec"
        float: "#fefbec"
        string: "#fefbec"
        nothing: "#fefbec"
        binary: "#fefbec"
        cellpath: "#fefbec"
        row_index: "#60ac39"
        record: "#fefbec"
        list: "#fefbec"
        block: "#fefbec"
        hints: "#7d7a68"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#b854d4"
        shape_bool: "#1fad83"
        shape_int: "#b854d4"
        shape_float: "#b854d4"
        shape_range: "#ae9513"
        shape_internalcall: "#1fad83"
        shape_external: "#1fad83"
        shape_externalarg: "#60ac39"
        shape_literal: "#6684e1"
        shape_operator: "#ae9513"
        shape_signature: "#60ac39"
        shape_string: "#60ac39"
        shape_string_interpolation: "#1fad83"
        shape_datetime: "#1fad83"
        shape_list: "#1fad83"
        shape_table: "#6684e1"
        shape_record: "#1fad83"
        shape_block: "#6684e1"
        shape_filepath: "#1fad83"
        shape_globpattern: "#1fad83"
        shape_variable: "#b854d4"
        shape_flag: "#6684e1"
        shape_custom: "#60ac39"
        shape_nothing: "#1fad83"
    }
}
