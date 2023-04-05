export def main [] { return {
    separator: "#eeeeee"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a8ff60" attr: "b" }
    empty: "#96cbfe"
    bool: {|| if $in { "#dfdffe" } else { "light_gray" } }
    int: "#eeeeee"
    filesize: {|e|
      if $e == 0b {
        "#eeeeee"
      } else if $e < 1mb {
        "#c6c5fe"
      } else {{ fg: "#96cbfe" }}
    }
    duration: "#eeeeee"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff6c60" attr: "b" }
      } else if $in < 6hr {
        "#ff6c60"
      } else if $in < 1day {
        "#ffffb6"
      } else if $in < 3day {
        "#a8ff60"
      } else if $in < 1wk {
        { fg: "#a8ff60" attr: "b" }
      } else if $in < 6wk {
        "#c6c5fe"
      } else if $in < 52wk {
        "#96cbfe"
      } else { "dark_gray" }
    }
    range: "#eeeeee"
    float: "#eeeeee"
    string: "#eeeeee"
    nothing: "#eeeeee"
    binary: "#eeeeee"
    cellpath: "#eeeeee"
    row_index: { fg: "#a8ff60" attr: "b" }
    record: "#eeeeee"
    list: "#eeeeee"
    block: "#eeeeee"
    hints: "dark_gray"

    shape_and: { fg: "#ff73fd" attr: "b" }
    shape_binary: { fg: "#ff73fd" attr: "b" }
    shape_block: { fg: "#96cbfe" attr: "b" }
    shape_bool: "#dfdffe"
    shape_custom: "#a8ff60"
    shape_datetime: { fg: "#c6c5fe" attr: "b" }
    shape_directory: "#c6c5fe"
    shape_external: "#c6c5fe"
    shape_externalarg: { fg: "#a8ff60" attr: "b" }
    shape_filepath: "#c6c5fe"
    shape_flag: { fg: "#96cbfe" attr: "b" }
    shape_float: { fg: "#ff73fd" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#c6c5fe" attr: "b" }
    shape_int: { fg: "#ff73fd" attr: "b" }
    shape_internalcall: { fg: "#c6c5fe" attr: "b" }
    shape_list: { fg: "#c6c5fe" attr: "b" }
    shape_literal: "#96cbfe"
    shape_match_pattern: "#a8ff60"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#dfdffe"
    shape_operator: "#ffffb6"
    shape_or: { fg: "#ff73fd" attr: "b" }
    shape_pipe: { fg: "#ff73fd" attr: "b" }
    shape_range: { fg: "#ffffb6" attr: "b" }
    shape_record: { fg: "#c6c5fe" attr: "b" }
    shape_redirection: { fg: "#ff73fd" attr: "b" }
    shape_signature: { fg: "#a8ff60" attr: "b" }
    shape_string: "#a8ff60"
    shape_string_interpolation: { fg: "#c6c5fe" attr: "b" }
    shape_table: { fg: "#96cbfe" attr: "b" }
    shape_variable: "#ff73fd"

    background: "#0000a4"
    foreground: "#ffff4e"
    cursor: "#ffff4e"
}}