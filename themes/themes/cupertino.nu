export def main [] { return {
    separator: "#404040"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#007400" attr: "b" }
    empty: "#0000ff"
    bool: {|| if $in { "#318495" } else { "light_gray" } }
    int: "#404040"
    filesize: {|e|
      if $e == 0b {
        "#404040"
      } else if $e < 1mb {
        "#318495"
      } else {{ fg: "#0000ff" }}
    }
    duration: "#404040"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#c41a15" attr: "b" }
      } else if $in < 6hr {
        "#c41a15"
      } else if $in < 1day {
        "#826b28"
      } else if $in < 3day {
        "#007400"
      } else if $in < 1wk {
        { fg: "#007400" attr: "b" }
      } else if $in < 6wk {
        "#318495"
      } else if $in < 52wk {
        "#0000ff"
      } else { "dark_gray" }
    }
    range: "#404040"
    float: "#404040"
    string: "#404040"
    nothing: "#404040"
    binary: "#404040"
    cellpath: "#404040"
    row_index: { fg: "#007400" attr: "b" }
    record: "#404040"
    list: "#404040"
    block: "#404040"
    hints: "dark_gray"

    shape_and: { fg: "#a90d91" attr: "b" }
    shape_binary: { fg: "#a90d91" attr: "b" }
    shape_block: { fg: "#0000ff" attr: "b" }
    shape_bool: "#318495"
    shape_custom: "#007400"
    shape_datetime: { fg: "#318495" attr: "b" }
    shape_directory: "#318495"
    shape_external: "#318495"
    shape_externalarg: { fg: "#007400" attr: "b" }
    shape_filepath: "#318495"
    shape_flag: { fg: "#0000ff" attr: "b" }
    shape_float: { fg: "#a90d91" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#318495" attr: "b" }
    shape_int: { fg: "#a90d91" attr: "b" }
    shape_internalcall: { fg: "#318495" attr: "b" }
    shape_list: { fg: "#318495" attr: "b" }
    shape_literal: "#0000ff"
    shape_match_pattern: "#007400"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#318495"
    shape_operator: "#826b28"
    shape_or: { fg: "#a90d91" attr: "b" }
    shape_pipe: { fg: "#a90d91" attr: "b" }
    shape_range: { fg: "#826b28" attr: "b" }
    shape_record: { fg: "#318495" attr: "b" }
    shape_redirection: { fg: "#a90d91" attr: "b" }
    shape_signature: { fg: "#007400" attr: "b" }
    shape_string: "#007400"
    shape_string_interpolation: { fg: "#318495" attr: "b" }
    shape_table: { fg: "#0000ff" attr: "b" }
    shape_variable: "#a90d91"

    background: "#ffffff"
    foreground: "#404040"
    cursor: "#404040"
}}