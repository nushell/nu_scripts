export def main [] { return {
    separator: "#f1eff8"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#6dfedf" attr: "b" }
    empty: "#2de0a7"
    bool: {|| if $in { "#8eaee0" } else { "light_gray" } }
    int: "#f1eff8"
    filesize: {|e|
      if $e == 0b {
        "#f1eff8"
      } else if $e < 1mb {
        "#8eaee0"
      } else {{ fg: "#2de0a7" }}
    }
    duration: "#f1eff8"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#a0a0c5" attr: "b" }
      } else if $in < 6hr {
        "#a0a0c5"
      } else if $in < 1day {
        "#ae81ff"
      } else if $in < 3day {
        "#6dfedf"
      } else if $in < 1wk {
        { fg: "#6dfedf" attr: "b" }
      } else if $in < 6wk {
        "#8eaee0"
      } else if $in < 52wk {
        "#2de0a7"
      } else { "dark_gray" }
    }
    range: "#f1eff8"
    float: "#f1eff8"
    string: "#f1eff8"
    nothing: "#f1eff8"
    binary: "#f1eff8"
    cellpath: "#f1eff8"
    row_index: { fg: "#6dfedf" attr: "b" }
    record: "#f1eff8"
    list: "#f1eff8"
    block: "#f1eff8"
    hints: "dark_gray"

    shape_and: { fg: "#7aa5ff" attr: "b" }
    shape_binary: { fg: "#7aa5ff" attr: "b" }
    shape_block: { fg: "#2de0a7" attr: "b" }
    shape_bool: "#8eaee0"
    shape_custom: "#6dfedf"
    shape_datetime: { fg: "#8eaee0" attr: "b" }
    shape_directory: "#8eaee0"
    shape_external: "#8eaee0"
    shape_externalarg: { fg: "#6dfedf" attr: "b" }
    shape_filepath: "#8eaee0"
    shape_flag: { fg: "#2de0a7" attr: "b" }
    shape_float: { fg: "#7aa5ff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#8eaee0" attr: "b" }
    shape_int: { fg: "#7aa5ff" attr: "b" }
    shape_internalcall: { fg: "#8eaee0" attr: "b" }
    shape_list: { fg: "#8eaee0" attr: "b" }
    shape_literal: "#2de0a7"
    shape_match_pattern: "#6dfedf"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8eaee0"
    shape_operator: "#ae81ff"
    shape_or: { fg: "#7aa5ff" attr: "b" }
    shape_pipe: { fg: "#7aa5ff" attr: "b" }
    shape_range: { fg: "#ae81ff" attr: "b" }
    shape_record: { fg: "#8eaee0" attr: "b" }
    shape_redirection: { fg: "#7aa5ff" attr: "b" }
    shape_signature: { fg: "#6dfedf" attr: "b" }
    shape_string: "#6dfedf"
    shape_string_interpolation: { fg: "#8eaee0" attr: "b" }
    shape_table: { fg: "#2de0a7" attr: "b" }
    shape_variable: "#7aa5ff"

    background: "#292a44"
    foreground: "#f1eff8"
    cursor: "#f1eff8"
}}