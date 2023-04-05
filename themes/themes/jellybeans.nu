export def main [] { return {
    separator: "#dedede"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#94b979" attr: "b" }
    empty: "#97bedc"
    bool: {|| if $in { "#1ab2a8" } else { "light_gray" } }
    int: "#dedede"
    filesize: {|e|
      if $e == 0b {
        "#dedede"
      } else if $e < 1mb {
        "#00988e"
      } else {{ fg: "#97bedc" }}
    }
    duration: "#dedede"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#e27373" attr: "b" }
      } else if $in < 6hr {
        "#e27373"
      } else if $in < 1day {
        "#ffba7b"
      } else if $in < 3day {
        "#94b979"
      } else if $in < 1wk {
        { fg: "#94b979" attr: "b" }
      } else if $in < 6wk {
        "#00988e"
      } else if $in < 52wk {
        "#97bedc"
      } else { "dark_gray" }
    }
    range: "#dedede"
    float: "#dedede"
    string: "#dedede"
    nothing: "#dedede"
    binary: "#dedede"
    cellpath: "#dedede"
    row_index: { fg: "#94b979" attr: "b" }
    record: "#dedede"
    list: "#dedede"
    block: "#dedede"
    hints: "dark_gray"

    shape_and: { fg: "#e1c0fa" attr: "b" }
    shape_binary: { fg: "#e1c0fa" attr: "b" }
    shape_block: { fg: "#97bedc" attr: "b" }
    shape_bool: "#1ab2a8"
    shape_custom: "#94b979"
    shape_datetime: { fg: "#00988e" attr: "b" }
    shape_directory: "#00988e"
    shape_external: "#00988e"
    shape_externalarg: { fg: "#94b979" attr: "b" }
    shape_filepath: "#00988e"
    shape_flag: { fg: "#97bedc" attr: "b" }
    shape_float: { fg: "#e1c0fa" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00988e" attr: "b" }
    shape_int: { fg: "#e1c0fa" attr: "b" }
    shape_internalcall: { fg: "#00988e" attr: "b" }
    shape_list: { fg: "#00988e" attr: "b" }
    shape_literal: "#97bedc"
    shape_match_pattern: "#94b979"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#1ab2a8"
    shape_operator: "#ffba7b"
    shape_or: { fg: "#e1c0fa" attr: "b" }
    shape_pipe: { fg: "#e1c0fa" attr: "b" }
    shape_range: { fg: "#ffba7b" attr: "b" }
    shape_record: { fg: "#00988e" attr: "b" }
    shape_redirection: { fg: "#e1c0fa" attr: "b" }
    shape_signature: { fg: "#94b979" attr: "b" }
    shape_string: "#94b979"
    shape_string_interpolation: { fg: "#00988e" attr: "b" }
    shape_table: { fg: "#97bedc" attr: "b" }
    shape_variable: "#e1c0fa"

    background: "#121212"
    foreground: "#dedede"
    cursor: "#dedede"
}}