export def main [] { return {
    separator: "#e2e4e1"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#206620" attr: "b" }
    empty: "#4b529a"
    bool: {|| if $in { "#106e8c" } else { "light_gray" } }
    int: "#e2e4e1"
    filesize: {|e|
      if $e == 0b {
        "#e2e4e1"
      } else if $e < 1mb {
        "#086784"
      } else {{ fg: "#4b529a" }}
    }
    duration: "#e2e4e1"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#a32a3a" attr: "b" }
      } else if $in < 6hr {
        "#a32a3a"
      } else if $in < 1day {
        "#745300"
      } else if $in < 3day {
        "#206620"
      } else if $in < 1wk {
        { fg: "#206620" attr: "b" }
      } else if $in < 6wk {
        "#086784"
      } else if $in < 52wk {
        "#4b529a"
      } else { "dark_gray" }
    }
    range: "#e2e4e1"
    float: "#e2e4e1"
    string: "#e2e4e1"
    nothing: "#e2e4e1"
    binary: "#e2e4e1"
    cellpath: "#e2e4e1"
    row_index: { fg: "#206620" attr: "b" }
    record: "#e2e4e1"
    list: "#e2e4e1"
    block: "#e2e4e1"
    hints: "dark_gray"

    shape_and: { fg: "#8d377e" attr: "b" }
    shape_binary: { fg: "#8d377e" attr: "b" }
    shape_block: { fg: "#4b529a" attr: "b" }
    shape_bool: "#106e8c"
    shape_custom: "#206620"
    shape_datetime: { fg: "#086784" attr: "b" }
    shape_directory: "#086784"
    shape_external: "#086784"
    shape_externalarg: { fg: "#206620" attr: "b" }
    shape_filepath: "#086784"
    shape_flag: { fg: "#4b529a" attr: "b" }
    shape_float: { fg: "#8d377e" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#086784" attr: "b" }
    shape_int: { fg: "#8d377e" attr: "b" }
    shape_internalcall: { fg: "#086784" attr: "b" }
    shape_list: { fg: "#086784" attr: "b" }
    shape_literal: "#4b529a"
    shape_match_pattern: "#206620"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#106e8c"
    shape_operator: "#745300"
    shape_or: { fg: "#8d377e" attr: "b" }
    shape_pipe: { fg: "#8d377e" attr: "b" }
    shape_range: { fg: "#745300" attr: "b" }
    shape_record: { fg: "#086784" attr: "b" }
    shape_redirection: { fg: "#8d377e" attr: "b" }
    shape_signature: { fg: "#206620" attr: "b" }
    shape_string: "#206620"
    shape_string_interpolation: { fg: "#086784" attr: "b" }
    shape_table: { fg: "#4b529a" attr: "b" }
    shape_variable: "#8d377e"

    background: "#eff0f2"
    foreground: "#4a4b4e"
    cursor: "#4a4b4e"
}}