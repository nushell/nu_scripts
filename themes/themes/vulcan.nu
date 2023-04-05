export def main [] { return {
    separator: "#5b778c"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#977d7c" attr: "b" }
    empty: "#977d7c"
    bool: {|| if $in { "#977d7c" } else { "light_gray" } }
    int: "#5b778c"
    filesize: {|e|
      if $e == 0b {
        "#5b778c"
      } else if $e < 1mb {
        "#977d7c"
      } else {{ fg: "#977d7c" }}
    }
    duration: "#5b778c"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#818591" attr: "b" }
      } else if $in < 6hr {
        "#818591"
      } else if $in < 1day {
        "#adb4b9"
      } else if $in < 3day {
        "#977d7c"
      } else if $in < 1wk {
        { fg: "#977d7c" attr: "b" }
      } else if $in < 6wk {
        "#977d7c"
      } else if $in < 52wk {
        "#977d7c"
      } else { "dark_gray" }
    }
    range: "#5b778c"
    float: "#5b778c"
    string: "#5b778c"
    nothing: "#5b778c"
    binary: "#5b778c"
    cellpath: "#5b778c"
    row_index: { fg: "#977d7c" attr: "b" }
    record: "#5b778c"
    list: "#5b778c"
    block: "#5b778c"
    hints: "dark_gray"

    shape_and: { fg: "#9198a3" attr: "b" }
    shape_binary: { fg: "#9198a3" attr: "b" }
    shape_block: { fg: "#977d7c" attr: "b" }
    shape_bool: "#977d7c"
    shape_custom: "#977d7c"
    shape_datetime: { fg: "#977d7c" attr: "b" }
    shape_directory: "#977d7c"
    shape_external: "#977d7c"
    shape_externalarg: { fg: "#977d7c" attr: "b" }
    shape_filepath: "#977d7c"
    shape_flag: { fg: "#977d7c" attr: "b" }
    shape_float: { fg: "#9198a3" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#977d7c" attr: "b" }
    shape_int: { fg: "#9198a3" attr: "b" }
    shape_internalcall: { fg: "#977d7c" attr: "b" }
    shape_list: { fg: "#977d7c" attr: "b" }
    shape_literal: "#977d7c"
    shape_match_pattern: "#977d7c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#977d7c"
    shape_operator: "#adb4b9"
    shape_or: { fg: "#9198a3" attr: "b" }
    shape_pipe: { fg: "#9198a3" attr: "b" }
    shape_range: { fg: "#adb4b9" attr: "b" }
    shape_record: { fg: "#977d7c" attr: "b" }
    shape_redirection: { fg: "#9198a3" attr: "b" }
    shape_signature: { fg: "#977d7c" attr: "b" }
    shape_string: "#977d7c"
    shape_string_interpolation: { fg: "#977d7c" attr: "b" }
    shape_table: { fg: "#977d7c" attr: "b" }
    shape_variable: "#9198a3"

    background: "#041523"
    foreground: "#5b778c"
    cursor: "#5b778c"
}}