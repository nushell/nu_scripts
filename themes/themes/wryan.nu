export def main [] { return {
    separator: "#899ca1"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#287373" attr: "b" }
    empty: "#395573"
    bool: {|| if $in { "#6096bf" } else { "light_gray" } }
    int: "#899ca1"
    filesize: {|e|
      if $e == 0b {
        "#899ca1"
      } else if $e < 1mb {
        "#31658c"
      } else {{ fg: "#395573" }}
    }
    duration: "#899ca1"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#8c4665" attr: "b" }
      } else if $in < 6hr {
        "#8c4665"
      } else if $in < 1day {
        "#7c7c99"
      } else if $in < 3day {
        "#287373"
      } else if $in < 1wk {
        { fg: "#287373" attr: "b" }
      } else if $in < 6wk {
        "#31658c"
      } else if $in < 52wk {
        "#395573"
      } else { "dark_gray" }
    }
    range: "#899ca1"
    float: "#899ca1"
    string: "#899ca1"
    nothing: "#899ca1"
    binary: "#899ca1"
    cellpath: "#899ca1"
    row_index: { fg: "#287373" attr: "b" }
    record: "#899ca1"
    list: "#899ca1"
    block: "#899ca1"
    hints: "dark_gray"

    shape_and: { fg: "#5e468c" attr: "b" }
    shape_binary: { fg: "#5e468c" attr: "b" }
    shape_block: { fg: "#395573" attr: "b" }
    shape_bool: "#6096bf"
    shape_custom: "#287373"
    shape_datetime: { fg: "#31658c" attr: "b" }
    shape_directory: "#31658c"
    shape_external: "#31658c"
    shape_externalarg: { fg: "#287373" attr: "b" }
    shape_filepath: "#31658c"
    shape_flag: { fg: "#395573" attr: "b" }
    shape_float: { fg: "#5e468c" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#31658c" attr: "b" }
    shape_int: { fg: "#5e468c" attr: "b" }
    shape_internalcall: { fg: "#31658c" attr: "b" }
    shape_list: { fg: "#31658c" attr: "b" }
    shape_literal: "#395573"
    shape_match_pattern: "#287373"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#6096bf"
    shape_operator: "#7c7c99"
    shape_or: { fg: "#5e468c" attr: "b" }
    shape_pipe: { fg: "#5e468c" attr: "b" }
    shape_range: { fg: "#7c7c99" attr: "b" }
    shape_record: { fg: "#31658c" attr: "b" }
    shape_redirection: { fg: "#5e468c" attr: "b" }
    shape_signature: { fg: "#287373" attr: "b" }
    shape_string: "#287373"
    shape_string_interpolation: { fg: "#31658c" attr: "b" }
    shape_table: { fg: "#395573" attr: "b" }
    shape_variable: "#5e468c"

    background: "#101010"
    foreground: "#999993"
    cursor: "#999993"
}}