export def main [] { return {
    separator: "#bbbbbb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#79ff0f" attr: "b" }
    empty: "#396bd7"
    bool: {|| if $in { "#7adff2" } else { "light_gray" } }
    int: "#bbbbbb"
    filesize: {|e|
      if $e == 0b {
        "#bbbbbb"
      } else if $e < 1mb {
        "#66ccff"
      } else {{ fg: "#396bd7" }}
    }
    duration: "#bbbbbb"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff0000" attr: "b" }
      } else if $in < 6hr {
        "#ff0000"
      } else if $in < 1day {
        "#d3bf00"
      } else if $in < 3day {
        "#79ff0f"
      } else if $in < 1wk {
        { fg: "#79ff0f" attr: "b" }
      } else if $in < 6wk {
        "#66ccff"
      } else if $in < 52wk {
        "#396bd7"
      } else { "dark_gray" }
    }
    range: "#bbbbbb"
    float: "#bbbbbb"
    string: "#bbbbbb"
    nothing: "#bbbbbb"
    binary: "#bbbbbb"
    cellpath: "#bbbbbb"
    row_index: { fg: "#79ff0f" attr: "b" }
    record: "#bbbbbb"
    list: "#bbbbbb"
    block: "#bbbbbb"
    hints: "dark_gray"

    shape_and: { fg: "#b449be" attr: "b" }
    shape_binary: { fg: "#b449be" attr: "b" }
    shape_block: { fg: "#396bd7" attr: "b" }
    shape_bool: "#7adff2"
    shape_custom: "#79ff0f"
    shape_datetime: { fg: "#66ccff" attr: "b" }
    shape_directory: "#66ccff"
    shape_external: "#66ccff"
    shape_externalarg: { fg: "#79ff0f" attr: "b" }
    shape_filepath: "#66ccff"
    shape_flag: { fg: "#396bd7" attr: "b" }
    shape_float: { fg: "#b449be" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#66ccff" attr: "b" }
    shape_int: { fg: "#b449be" attr: "b" }
    shape_internalcall: { fg: "#66ccff" attr: "b" }
    shape_list: { fg: "#66ccff" attr: "b" }
    shape_literal: "#396bd7"
    shape_match_pattern: "#79ff0f"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#7adff2"
    shape_operator: "#d3bf00"
    shape_or: { fg: "#b449be" attr: "b" }
    shape_pipe: { fg: "#b449be" attr: "b" }
    shape_range: { fg: "#d3bf00" attr: "b" }
    shape_record: { fg: "#66ccff" attr: "b" }
    shape_redirection: { fg: "#b449be" attr: "b" }
    shape_signature: { fg: "#79ff0f" attr: "b" }
    shape_string: "#79ff0f"
    shape_string_interpolation: { fg: "#66ccff" attr: "b" }
    shape_table: { fg: "#396bd7" attr: "b" }
    shape_variable: "#b449be"

    background: "#000000"
    foreground: "#f2f2f2"
    cursor: "#f2f2f2"
}}