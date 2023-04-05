export def main [] { return {
    separator: "#444444"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#8700af" attr: "b" }
    empty: "#d75f00"
    bool: {|| if $in { "#d75f00" } else { "light_gray" } }
    int: "#444444"
    filesize: {|e|
      if $e == 0b {
        "#444444"
      } else if $e < 1mb {
        "#d75f00"
      } else {{ fg: "#d75f00" }}
    }
    duration: "#444444"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#bcbcbc" attr: "b" }
      } else if $in < 6hr {
        "#bcbcbc"
      } else if $in < 1day {
        "#d70087"
      } else if $in < 3day {
        "#8700af"
      } else if $in < 1wk {
        { fg: "#8700af" attr: "b" }
      } else if $in < 6wk {
        "#d75f00"
      } else if $in < 52wk {
        "#d75f00"
      } else { "dark_gray" }
    }
    range: "#444444"
    float: "#444444"
    string: "#444444"
    nothing: "#444444"
    binary: "#444444"
    cellpath: "#444444"
    row_index: { fg: "#8700af" attr: "b" }
    record: "#444444"
    list: "#444444"
    block: "#444444"
    hints: "dark_gray"

    shape_and: { fg: "#005faf" attr: "b" }
    shape_binary: { fg: "#005faf" attr: "b" }
    shape_block: { fg: "#d75f00" attr: "b" }
    shape_bool: "#d75f00"
    shape_custom: "#8700af"
    shape_datetime: { fg: "#d75f00" attr: "b" }
    shape_directory: "#d75f00"
    shape_external: "#d75f00"
    shape_externalarg: { fg: "#8700af" attr: "b" }
    shape_filepath: "#d75f00"
    shape_flag: { fg: "#d75f00" attr: "b" }
    shape_float: { fg: "#005faf" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#d75f00" attr: "b" }
    shape_int: { fg: "#005faf" attr: "b" }
    shape_internalcall: { fg: "#d75f00" attr: "b" }
    shape_list: { fg: "#d75f00" attr: "b" }
    shape_literal: "#d75f00"
    shape_match_pattern: "#8700af"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#d75f00"
    shape_operator: "#d70087"
    shape_or: { fg: "#005faf" attr: "b" }
    shape_pipe: { fg: "#005faf" attr: "b" }
    shape_range: { fg: "#d70087" attr: "b" }
    shape_record: { fg: "#d75f00" attr: "b" }
    shape_redirection: { fg: "#005faf" attr: "b" }
    shape_signature: { fg: "#8700af" attr: "b" }
    shape_string: "#8700af"
    shape_string_interpolation: { fg: "#d75f00" attr: "b" }
    shape_table: { fg: "#d75f00" attr: "b" }
    shape_variable: "#005faf"

    background: "#eeeeee"
    foreground: "#444444"
    cursor: "#444444"
}}