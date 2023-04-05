export def main [] { return {
    separator: "#eeeeec"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7fe173" attr: "b" }
    empty: "#4099ff"
    bool: {|| if $in { "#dcf4ff" } else { "light_gray" } }
    int: "#eeeeec"
    filesize: {|e|
      if $e == 0b {
        "#eeeeec"
      } else if $e < 1mb {
        "#bed6ff"
      } else {{ fg: "#4099ff" }}
    }
    duration: "#eeeeec"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#d25252" attr: "b" }
      } else if $in < 6hr {
        "#d25252"
      } else if $in < 1day {
        "#ffc66d"
      } else if $in < 3day {
        "#7fe173"
      } else if $in < 1wk {
        { fg: "#7fe173" attr: "b" }
      } else if $in < 6wk {
        "#bed6ff"
      } else if $in < 52wk {
        "#4099ff"
      } else { "dark_gray" }
    }
    range: "#eeeeec"
    float: "#eeeeec"
    string: "#eeeeec"
    nothing: "#eeeeec"
    binary: "#eeeeec"
    cellpath: "#eeeeec"
    row_index: { fg: "#7fe173" attr: "b" }
    record: "#eeeeec"
    list: "#eeeeec"
    block: "#eeeeec"
    hints: "dark_gray"

    shape_and: { fg: "#f680ff" attr: "b" }
    shape_binary: { fg: "#f680ff" attr: "b" }
    shape_block: { fg: "#4099ff" attr: "b" }
    shape_bool: "#dcf4ff"
    shape_custom: "#7fe173"
    shape_datetime: { fg: "#bed6ff" attr: "b" }
    shape_directory: "#bed6ff"
    shape_external: "#bed6ff"
    shape_externalarg: { fg: "#7fe173" attr: "b" }
    shape_filepath: "#bed6ff"
    shape_flag: { fg: "#4099ff" attr: "b" }
    shape_float: { fg: "#f680ff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#bed6ff" attr: "b" }
    shape_int: { fg: "#f680ff" attr: "b" }
    shape_internalcall: { fg: "#bed6ff" attr: "b" }
    shape_list: { fg: "#bed6ff" attr: "b" }
    shape_literal: "#4099ff"
    shape_match_pattern: "#7fe173"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#dcf4ff"
    shape_operator: "#ffc66d"
    shape_or: { fg: "#f680ff" attr: "b" }
    shape_pipe: { fg: "#f680ff" attr: "b" }
    shape_range: { fg: "#ffc66d" attr: "b" }
    shape_record: { fg: "#bed6ff" attr: "b" }
    shape_redirection: { fg: "#f680ff" attr: "b" }
    shape_signature: { fg: "#7fe173" attr: "b" }
    shape_string: "#7fe173"
    shape_string_interpolation: { fg: "#bed6ff" attr: "b" }
    shape_table: { fg: "#4099ff" attr: "b" }
    shape_variable: "#f680ff"

    background: "#323232"
    foreground: "#ffffff"
    cursor: "#ffffff"
}}