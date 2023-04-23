export def main [] { return {
    separator: "#f2f2f2"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#6fdd00" attr: "b" }
    empty: "#006fdd"
    bool: {|| if $in { "#74ffb9" } else { "light_gray" } }
    int: "#f2f2f2"
    filesize: {|e|
      if $e == 0b {
        "#f2f2f2"
      } else if $e < 1mb {
        "#00dd6f"
      } else {{ fg: "#006fdd" }}
    }
    duration: "#f2f2f2"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#dd006f" attr: "b" }
      } else if $in < 6hr {
        "#dd006f"
      } else if $in < 1day {
        "#dd6f00"
      } else if $in < 3day {
        "#6fdd00"
      } else if $in < 1wk {
        { fg: "#6fdd00" attr: "b" }
      } else if $in < 6wk {
        "#00dd6f"
      } else if $in < 52wk {
        "#006fdd"
      } else { "dark_gray" }
    }
    range: "#f2f2f2"
    float: "#f2f2f2"
    string: "#f2f2f2"
    nothing: "#f2f2f2"
    binary: "#f2f2f2"
    cellpath: "#f2f2f2"
    row_index: { fg: "#6fdd00" attr: "b" }
    record: "#f2f2f2"
    list: "#f2f2f2"
    block: "#f2f2f2"
    hints: "dark_gray"

    shape_and: { fg: "#6f00dd" attr: "b" }
    shape_binary: { fg: "#6f00dd" attr: "b" }
    shape_block: { fg: "#006fdd" attr: "b" }
    shape_bool: "#74ffb9"
    shape_custom: "#6fdd00"
    shape_datetime: { fg: "#00dd6f" attr: "b" }
    shape_directory: "#00dd6f"
    shape_external: "#00dd6f"
    shape_externalarg: { fg: "#6fdd00" attr: "b" }
    shape_filepath: "#00dd6f"
    shape_flag: { fg: "#006fdd" attr: "b" }
    shape_float: { fg: "#6f00dd" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00dd6f" attr: "b" }
    shape_int: { fg: "#6f00dd" attr: "b" }
    shape_internalcall: { fg: "#00dd6f" attr: "b" }
    shape_list: { fg: "#00dd6f" attr: "b" }
    shape_literal: "#006fdd"
    shape_match_pattern: "#6fdd00"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#74ffb9"
    shape_operator: "#dd6f00"
    shape_or: { fg: "#6f00dd" attr: "b" }
    shape_pipe: { fg: "#6f00dd" attr: "b" }
    shape_range: { fg: "#dd6f00" attr: "b" }
    shape_record: { fg: "#00dd6f" attr: "b" }
    shape_redirection: { fg: "#6f00dd" attr: "b" }
    shape_signature: { fg: "#6fdd00" attr: "b" }
    shape_string: "#6fdd00"
    shape_string_interpolation: { fg: "#00dd6f" attr: "b" }
    shape_table: { fg: "#006fdd" attr: "b" }
    shape_variable: "#6f00dd"

    background: "#758480"
    foreground: "#23476a"
    cursor: "#23476a"
}}