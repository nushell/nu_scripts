export def main [] { return {
    separator: "#736e55"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#5ceb5a" attr: "b" }
    empty: "#489bf0"
    bool: {|| if $in { "#5aebbc" } else { "light_gray" } }
    int: "#736e55"
    filesize: {|e|
      if $e == 0b {
        "#736e55"
      } else if $e < 1mb {
        "#5aebbc"
      } else {{ fg: "#489bf0" }}
    }
    duration: "#736e55"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#e35142" attr: "b" }
      } else if $in < 6hr {
        "#e35142"
      } else if $in < 1day {
        "#f2ff27"
      } else if $in < 3day {
        "#5ceb5a"
      } else if $in < 1wk {
        { fg: "#5ceb5a" attr: "b" }
      } else if $in < 6wk {
        "#5aebbc"
      } else if $in < 52wk {
        "#489bf0"
      } else { "dark_gray" }
    }
    range: "#736e55"
    float: "#736e55"
    string: "#736e55"
    nothing: "#736e55"
    binary: "#736e55"
    cellpath: "#736e55"
    row_index: { fg: "#5ceb5a" attr: "b" }
    record: "#736e55"
    list: "#736e55"
    block: "#736e55"
    hints: "dark_gray"

    shape_and: { fg: "#ff8080" attr: "b" }
    shape_binary: { fg: "#ff8080" attr: "b" }
    shape_block: { fg: "#489bf0" attr: "b" }
    shape_bool: "#5aebbc"
    shape_custom: "#5ceb5a"
    shape_datetime: { fg: "#5aebbc" attr: "b" }
    shape_directory: "#5aebbc"
    shape_external: "#5aebbc"
    shape_externalarg: { fg: "#5ceb5a" attr: "b" }
    shape_filepath: "#5aebbc"
    shape_flag: { fg: "#489bf0" attr: "b" }
    shape_float: { fg: "#ff8080" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#5aebbc" attr: "b" }
    shape_int: { fg: "#ff8080" attr: "b" }
    shape_internalcall: { fg: "#5aebbc" attr: "b" }
    shape_list: { fg: "#5aebbc" attr: "b" }
    shape_literal: "#489bf0"
    shape_match_pattern: "#5ceb5a"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#5aebbc"
    shape_operator: "#f2ff27"
    shape_or: { fg: "#ff8080" attr: "b" }
    shape_pipe: { fg: "#ff8080" attr: "b" }
    shape_range: { fg: "#f2ff27" attr: "b" }
    shape_record: { fg: "#5aebbc" attr: "b" }
    shape_redirection: { fg: "#ff8080" attr: "b" }
    shape_signature: { fg: "#5ceb5a" attr: "b" }
    shape_string: "#5ceb5a"
    shape_string_interpolation: { fg: "#5aebbc" attr: "b" }
    shape_table: { fg: "#489bf0" attr: "b" }
    shape_variable: "#ff8080"

    background: "#1c1810"
    foreground: "#736e55"
    cursor: "#736e55"
}}