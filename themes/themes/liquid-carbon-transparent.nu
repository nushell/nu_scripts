export def main [] { return {
    separator: "#bccccc"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#559a70" attr: "b" }
    empty: "#0099cc"
    bool: {|| if $in { "#7ac4cc" } else { "light_gray" } }
    int: "#bccccc"
    filesize: {|e|
      if $e == 0b {
        "#bccccc"
      } else if $e < 1mb {
        "#7ac4cc"
      } else {{ fg: "#0099cc" }}
    }
    duration: "#bccccc"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff3030" attr: "b" }
      } else if $in < 6hr {
        "#ff3030"
      } else if $in < 1day {
        "#ccac00"
      } else if $in < 3day {
        "#559a70"
      } else if $in < 1wk {
        { fg: "#559a70" attr: "b" }
      } else if $in < 6wk {
        "#7ac4cc"
      } else if $in < 52wk {
        "#0099cc"
      } else { "dark_gray" }
    }
    range: "#bccccc"
    float: "#bccccc"
    string: "#bccccc"
    nothing: "#bccccc"
    binary: "#bccccc"
    cellpath: "#bccccc"
    row_index: { fg: "#559a70" attr: "b" }
    record: "#bccccc"
    list: "#bccccc"
    block: "#bccccc"
    hints: "dark_gray"

    shape_and: { fg: "#cc69c8" attr: "b" }
    shape_binary: { fg: "#cc69c8" attr: "b" }
    shape_block: { fg: "#0099cc" attr: "b" }
    shape_bool: "#7ac4cc"
    shape_custom: "#559a70"
    shape_datetime: { fg: "#7ac4cc" attr: "b" }
    shape_directory: "#7ac4cc"
    shape_external: "#7ac4cc"
    shape_externalarg: { fg: "#559a70" attr: "b" }
    shape_filepath: "#7ac4cc"
    shape_flag: { fg: "#0099cc" attr: "b" }
    shape_float: { fg: "#cc69c8" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#7ac4cc" attr: "b" }
    shape_int: { fg: "#cc69c8" attr: "b" }
    shape_internalcall: { fg: "#7ac4cc" attr: "b" }
    shape_list: { fg: "#7ac4cc" attr: "b" }
    shape_literal: "#0099cc"
    shape_match_pattern: "#559a70"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#7ac4cc"
    shape_operator: "#ccac00"
    shape_or: { fg: "#cc69c8" attr: "b" }
    shape_pipe: { fg: "#cc69c8" attr: "b" }
    shape_range: { fg: "#ccac00" attr: "b" }
    shape_record: { fg: "#7ac4cc" attr: "b" }
    shape_redirection: { fg: "#cc69c8" attr: "b" }
    shape_signature: { fg: "#559a70" attr: "b" }
    shape_string: "#559a70"
    shape_string_interpolation: { fg: "#7ac4cc" attr: "b" }
    shape_table: { fg: "#0099cc" attr: "b" }
    shape_variable: "#cc69c8"

    background: "#000000"
    foreground: "#afc2c2"
    cursor: "#afc2c2"
}}