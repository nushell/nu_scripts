export def main [] {
    # extra desired values for the tempus_totus theme
    # which do not fit into any nushell theme
    # these colors should be handledd by the terminal
    # emulator itself
    #
    # background: "#ffffff"
    # foreground: "#4a484d"
    # cursor: "#4a484d"

    {
        # color for nushell primitives
        separator: "#ffffff"
        leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
        header: "#4a5700"
        empty: "#1d3fcf"
        bool: "#ffffff"
        int: "#ffffff"
        filesize: "#ffffff"
        duration: "#ffffff"
        date: "#ffffff"
        range: "#ffffff"
        float: "#ffffff"
        string: "#ffffff"
        nothing: "#ffffff"
        binary: "#ffffff"
        cellpath: "#ffffff"
        row_index: "#4a5700"
        record: "#ffffff"
        list: "#ffffff"
        block: "#ffffff"
        hints: "#5f4d4f"

        # shapes are used to change the cli syntax highlighting
        shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
        shape_binary: "#7310cb"
        shape_bool: "#005589"
        shape_int: "#7310cb"
        shape_float: "#7310cb"
        shape_range: "#8b3800"
        shape_internalcall: "#005589"
        shape_external: "#185870"
        shape_externalarg: "#4a5700"
        shape_literal: "#1d3fcf"
        shape_operator: "#714900"
        shape_signature: "#4a5700"
        shape_string: "#005f26"
        shape_string_interpolation: "#005589"
        shape_datetime: "#005589"
        shape_list: "#005589"
        shape_table: "#2d48b0"
        shape_record: "#005589"
        shape_block: "#2d48b0"
        shape_filepath: "#185870"
        shape_globpattern: "#005589"
        shape_variable: "#882a7a"
        shape_flag: "#2d48b0"
        shape_custom: "#005f26"
        shape_nothing: "#005589"
    }
}
