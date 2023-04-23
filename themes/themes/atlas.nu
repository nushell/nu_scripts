export def main [] { return {
    separator: "#a1a19a"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7fc06e" attr: "b" }
    empty: "#5dd7b9"
    bool: {|| if $in { "#14747e" } else { "light_gray" } }
    int: "#a1a19a"
    filesize: {|e|
      if $e == 0b {
        "#a1a19a"
      } else if $e < 1mb {
        "#14747e"
      } else {{ fg: "#5dd7b9" }}
    }
    duration: "#a1a19a"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff5a67" attr: "b" }
      } else if $in < 6hr {
        "#ff5a67"
      } else if $in < 1day {
        "#ffcc1b"
      } else if $in < 3day {
        "#7fc06e"
      } else if $in < 1wk {
        { fg: "#7fc06e" attr: "b" }
      } else if $in < 6wk {
        "#14747e"
      } else if $in < 52wk {
        "#5dd7b9"
      } else { "dark_gray" }
    }
    range: "#a1a19a"
    float: "#a1a19a"
    string: "#a1a19a"
    nothing: "#a1a19a"
    binary: "#a1a19a"
    cellpath: "#a1a19a"
    row_index: { fg: "#7fc06e" attr: "b" }
    record: "#a1a19a"
    list: "#a1a19a"
    block: "#a1a19a"
    hints: "dark_gray"

    shape_and: { fg: "#9a70a4" attr: "b" }
    shape_binary: { fg: "#9a70a4" attr: "b" }
    shape_block: { fg: "#5dd7b9" attr: "b" }
    shape_bool: "#14747e"
    shape_custom: "#7fc06e"
    shape_datetime: { fg: "#14747e" attr: "b" }
    shape_directory: "#14747e"
    shape_external: "#14747e"
    shape_externalarg: { fg: "#7fc06e" attr: "b" }
    shape_filepath: "#14747e"
    shape_flag: { fg: "#5dd7b9" attr: "b" }
    shape_float: { fg: "#9a70a4" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#14747e" attr: "b" }
    shape_int: { fg: "#9a70a4" attr: "b" }
    shape_internalcall: { fg: "#14747e" attr: "b" }
    shape_list: { fg: "#14747e" attr: "b" }
    shape_literal: "#5dd7b9"
    shape_match_pattern: "#7fc06e"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#14747e"
    shape_operator: "#ffcc1b"
    shape_or: { fg: "#9a70a4" attr: "b" }
    shape_pipe: { fg: "#9a70a4" attr: "b" }
    shape_range: { fg: "#ffcc1b" attr: "b" }
    shape_record: { fg: "#14747e" attr: "b" }
    shape_redirection: { fg: "#9a70a4" attr: "b" }
    shape_signature: { fg: "#7fc06e" attr: "b" }
    shape_string: "#7fc06e"
    shape_string_interpolation: { fg: "#14747e" attr: "b" }
    shape_table: { fg: "#5dd7b9" attr: "b" }
    shape_variable: "#9a70a4"

    background: "#002635"
    foreground: "#a1a19a"
    cursor: "#a1a19a"
}}