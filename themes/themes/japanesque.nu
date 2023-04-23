export def main [] { return {
    separator: "#fafaf6"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7bb75b" attr: "b" }
    empty: "#4c9ad4"
    bool: {|| if $in { "#76bbca" } else { "light_gray" } }
    int: "#fafaf6"
    filesize: {|e|
      if $e == 0b {
        "#fafaf6"
      } else if $e < 1mb {
        "#389aad"
      } else {{ fg: "#4c9ad4" }}
    }
    duration: "#fafaf6"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#cf3f61" attr: "b" }
      } else if $in < 6hr {
        "#cf3f61"
      } else if $in < 1day {
        "#e9b32a"
      } else if $in < 3day {
        "#7bb75b"
      } else if $in < 1wk {
        { fg: "#7bb75b" attr: "b" }
      } else if $in < 6wk {
        "#389aad"
      } else if $in < 52wk {
        "#4c9ad4"
      } else { "dark_gray" }
    }
    range: "#fafaf6"
    float: "#fafaf6"
    string: "#fafaf6"
    nothing: "#fafaf6"
    binary: "#fafaf6"
    cellpath: "#fafaf6"
    row_index: { fg: "#7bb75b" attr: "b" }
    record: "#fafaf6"
    list: "#fafaf6"
    block: "#fafaf6"
    hints: "dark_gray"

    shape_and: { fg: "#a57fc4" attr: "b" }
    shape_binary: { fg: "#a57fc4" attr: "b" }
    shape_block: { fg: "#4c9ad4" attr: "b" }
    shape_bool: "#76bbca"
    shape_custom: "#7bb75b"
    shape_datetime: { fg: "#389aad" attr: "b" }
    shape_directory: "#389aad"
    shape_external: "#389aad"
    shape_externalarg: { fg: "#7bb75b" attr: "b" }
    shape_filepath: "#389aad"
    shape_flag: { fg: "#4c9ad4" attr: "b" }
    shape_float: { fg: "#a57fc4" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#389aad" attr: "b" }
    shape_int: { fg: "#a57fc4" attr: "b" }
    shape_internalcall: { fg: "#389aad" attr: "b" }
    shape_list: { fg: "#389aad" attr: "b" }
    shape_literal: "#4c9ad4"
    shape_match_pattern: "#7bb75b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#76bbca"
    shape_operator: "#e9b32a"
    shape_or: { fg: "#a57fc4" attr: "b" }
    shape_pipe: { fg: "#a57fc4" attr: "b" }
    shape_range: { fg: "#e9b32a" attr: "b" }
    shape_record: { fg: "#389aad" attr: "b" }
    shape_redirection: { fg: "#a57fc4" attr: "b" }
    shape_signature: { fg: "#7bb75b" attr: "b" }
    shape_string: "#7bb75b"
    shape_string_interpolation: { fg: "#389aad" attr: "b" }
    shape_table: { fg: "#4c9ad4" attr: "b" }
    shape_variable: "#a57fc4"

    background: "#1e1e1e"
    foreground: "#f7f6ec"
    cursor: "#f7f6ec"
}}