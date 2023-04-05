export def main [] { return {
    separator: "#d3d3d3"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#719611" attr: "b" }
    empty: "#6688aa"
    bool: {|| if $in { "#87ceeb" } else { "light_gray" } }
    int: "#d3d3d3"
    filesize: {|e|
      if $e == 0b {
        "#d3d3d3"
      } else if $e < 1mb {
        "#528b8b"
      } else {{ fg: "#6688aa" }}
    }
    duration: "#d3d3d3"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#aa4450" attr: "b" }
      } else if $in < 6hr {
        "#aa4450"
      } else if $in < 1day {
        "#ff9800"
      } else if $in < 3day {
        "#719611"
      } else if $in < 1wk {
        { fg: "#719611" attr: "b" }
      } else if $in < 6wk {
        "#528b8b"
      } else if $in < 52wk {
        "#6688aa"
      } else { "dark_gray" }
    }
    range: "#d3d3d3"
    float: "#d3d3d3"
    string: "#d3d3d3"
    nothing: "#d3d3d3"
    binary: "#d3d3d3"
    cellpath: "#d3d3d3"
    row_index: { fg: "#719611" attr: "b" }
    record: "#d3d3d3"
    list: "#d3d3d3"
    block: "#d3d3d3"
    hints: "dark_gray"

    shape_and: { fg: "#8f6f8f" attr: "b" }
    shape_binary: { fg: "#8f6f8f" attr: "b" }
    shape_block: { fg: "#6688aa" attr: "b" }
    shape_bool: "#87ceeb"
    shape_custom: "#719611"
    shape_datetime: { fg: "#528b8b" attr: "b" }
    shape_directory: "#528b8b"
    shape_external: "#528b8b"
    shape_externalarg: { fg: "#719611" attr: "b" }
    shape_filepath: "#528b8b"
    shape_flag: { fg: "#6688aa" attr: "b" }
    shape_float: { fg: "#8f6f8f" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#528b8b" attr: "b" }
    shape_int: { fg: "#8f6f8f" attr: "b" }
    shape_internalcall: { fg: "#528b8b" attr: "b" }
    shape_list: { fg: "#528b8b" attr: "b" }
    shape_literal: "#6688aa"
    shape_match_pattern: "#719611"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#87ceeb"
    shape_operator: "#ff9800"
    shape_or: { fg: "#8f6f8f" attr: "b" }
    shape_pipe: { fg: "#8f6f8f" attr: "b" }
    shape_range: { fg: "#ff9800" attr: "b" }
    shape_record: { fg: "#528b8b" attr: "b" }
    shape_redirection: { fg: "#8f6f8f" attr: "b" }
    shape_signature: { fg: "#719611" attr: "b" }
    shape_string: "#719611"
    shape_string_interpolation: { fg: "#528b8b" attr: "b" }
    shape_table: { fg: "#6688aa" attr: "b" }
    shape_variable: "#8f6f8f"

    background: "#222222"
    foreground: "#c2c2b0"
    cursor: "#c2c2b0"
}}