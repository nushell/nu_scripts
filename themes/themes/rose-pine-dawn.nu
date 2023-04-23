export def main [] { return {
    separator: "#575279"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#d7827e" attr: "b" }
    empty: "#56949f"
    bool: {|| if $in { "#286983" } else { "light_gray" } }
    int: "#575279"
    filesize: {|e|
      if $e == 0b {
        "#575279"
      } else if $e < 1mb {
        "#286983"
      } else {{ fg: "#56949f" }}
    }
    duration: "#575279"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#1f1d2e" attr: "b" }
      } else if $in < 6hr {
        "#1f1d2e"
      } else if $in < 1day {
        "#ea9d34"
      } else if $in < 3day {
        "#d7827e"
      } else if $in < 1wk {
        { fg: "#d7827e" attr: "b" }
      } else if $in < 6wk {
        "#286983"
      } else if $in < 52wk {
        "#56949f"
      } else { "dark_gray" }
    }
    range: "#575279"
    float: "#575279"
    string: "#575279"
    nothing: "#575279"
    binary: "#575279"
    cellpath: "#575279"
    row_index: { fg: "#d7827e" attr: "b" }
    record: "#575279"
    list: "#575279"
    block: "#575279"
    hints: "dark_gray"

    shape_and: { fg: "#907aa9" attr: "b" }
    shape_binary: { fg: "#907aa9" attr: "b" }
    shape_block: { fg: "#56949f" attr: "b" }
    shape_bool: "#286983"
    shape_custom: "#d7827e"
    shape_datetime: { fg: "#286983" attr: "b" }
    shape_directory: "#286983"
    shape_external: "#286983"
    shape_externalarg: { fg: "#d7827e" attr: "b" }
    shape_filepath: "#286983"
    shape_flag: { fg: "#56949f" attr: "b" }
    shape_float: { fg: "#907aa9" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#286983" attr: "b" }
    shape_int: { fg: "#907aa9" attr: "b" }
    shape_internalcall: { fg: "#286983" attr: "b" }
    shape_list: { fg: "#286983" attr: "b" }
    shape_literal: "#56949f"
    shape_match_pattern: "#d7827e"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#286983"
    shape_operator: "#ea9d34"
    shape_or: { fg: "#907aa9" attr: "b" }
    shape_pipe: { fg: "#907aa9" attr: "b" }
    shape_range: { fg: "#ea9d34" attr: "b" }
    shape_record: { fg: "#286983" attr: "b" }
    shape_redirection: { fg: "#907aa9" attr: "b" }
    shape_signature: { fg: "#d7827e" attr: "b" }
    shape_string: "#d7827e"
    shape_string_interpolation: { fg: "#286983" attr: "b" }
    shape_table: { fg: "#56949f" attr: "b" }
    shape_variable: "#907aa9"

    background: "#faf4ed"
    foreground: "#575279"
    cursor: "#575279"
}}