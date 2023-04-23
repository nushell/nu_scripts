export def main [] { return {
    separator: "#949d9f"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#8c9e3d" attr: "b" }
    empty: "#6e9cb0"
    bool: {|| if $in { "#7aa880" } else { "light_gray" } }
    int: "#949d9f"
    filesize: {|e|
      if $e == 0b {
        "#949d9f"
      } else if $e < 1mb {
        "#6da280"
      } else {{ fg: "#6e9cb0" }}
    }
    duration: "#949d9f"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#d2813d" attr: "b" }
      } else if $in < 6hr {
        "#d2813d"
      } else if $in < 1day {
        "#b1942b"
      } else if $in < 3day {
        "#8c9e3d"
      } else if $in < 1wk {
        { fg: "#8c9e3d" attr: "b" }
      } else if $in < 6wk {
        "#6da280"
      } else if $in < 52wk {
        "#6e9cb0"
      } else { "dark_gray" }
    }
    range: "#949d9f"
    float: "#949d9f"
    string: "#949d9f"
    nothing: "#949d9f"
    binary: "#949d9f"
    cellpath: "#949d9f"
    row_index: { fg: "#8c9e3d" attr: "b" }
    record: "#949d9f"
    list: "#949d9f"
    block: "#949d9f"
    hints: "dark_gray"

    shape_and: { fg: "#b58d88" attr: "b" }
    shape_binary: { fg: "#b58d88" attr: "b" }
    shape_block: { fg: "#6e9cb0" attr: "b" }
    shape_bool: "#7aa880"
    shape_custom: "#8c9e3d"
    shape_datetime: { fg: "#6da280" attr: "b" }
    shape_directory: "#6da280"
    shape_external: "#6da280"
    shape_externalarg: { fg: "#8c9e3d" attr: "b" }
    shape_filepath: "#6da280"
    shape_flag: { fg: "#6e9cb0" attr: "b" }
    shape_float: { fg: "#b58d88" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#6da280" attr: "b" }
    shape_int: { fg: "#b58d88" attr: "b" }
    shape_internalcall: { fg: "#6da280" attr: "b" }
    shape_list: { fg: "#6da280" attr: "b" }
    shape_literal: "#6e9cb0"
    shape_match_pattern: "#8c9e3d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#7aa880"
    shape_operator: "#b1942b"
    shape_or: { fg: "#b58d88" attr: "b" }
    shape_pipe: { fg: "#b58d88" attr: "b" }
    shape_range: { fg: "#b1942b" attr: "b" }
    shape_record: { fg: "#6da280" attr: "b" }
    shape_redirection: { fg: "#b58d88" attr: "b" }
    shape_signature: { fg: "#8c9e3d" attr: "b" }
    shape_string: "#8c9e3d"
    shape_string_interpolation: { fg: "#6da280" attr: "b" }
    shape_table: { fg: "#6e9cb0" attr: "b" }
    shape_variable: "#b58d88"

    background: "#232323"
    foreground: "#aeadaf"
    cursor: "#aeadaf"
}}