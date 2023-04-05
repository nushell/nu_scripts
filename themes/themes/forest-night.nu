export def main [] { return {
    separator: "#ffebc3"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a9dd9d" attr: "b" }
    empty: "#bdd0e5"
    bool: {|| if $in { "#a9dd9d" } else { "light_gray" } }
    int: "#ffebc3"
    filesize: {|e|
      if $e == 0b {
        "#ffebc3"
      } else if $e < 1mb {
        "#a9dd9d"
      } else {{ fg: "#bdd0e5" }}
    }
    duration: "#ffebc3"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#fd8489" attr: "b" }
      } else if $in < 6hr {
        "#fd8489"
      } else if $in < 1day {
        "#f0aa8a"
      } else if $in < 3day {
        "#a9dd9d"
      } else if $in < 1wk {
        { fg: "#a9dd9d" attr: "b" }
      } else if $in < 6wk {
        "#a9dd9d"
      } else if $in < 52wk {
        "#bdd0e5"
      } else { "dark_gray" }
    }
    range: "#ffebc3"
    float: "#ffebc3"
    string: "#ffebc3"
    nothing: "#ffebc3"
    binary: "#ffebc3"
    cellpath: "#ffebc3"
    row_index: { fg: "#a9dd9d" attr: "b" }
    record: "#ffebc3"
    list: "#ffebc3"
    block: "#ffebc3"
    hints: "dark_gray"

    shape_and: { fg: "#daccf0" attr: "b" }
    shape_binary: { fg: "#daccf0" attr: "b" }
    shape_block: { fg: "#bdd0e5" attr: "b" }
    shape_bool: "#a9dd9d"
    shape_custom: "#a9dd9d"
    shape_datetime: { fg: "#a9dd9d" attr: "b" }
    shape_directory: "#a9dd9d"
    shape_external: "#a9dd9d"
    shape_externalarg: { fg: "#a9dd9d" attr: "b" }
    shape_filepath: "#a9dd9d"
    shape_flag: { fg: "#bdd0e5" attr: "b" }
    shape_float: { fg: "#daccf0" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#a9dd9d" attr: "b" }
    shape_int: { fg: "#daccf0" attr: "b" }
    shape_internalcall: { fg: "#a9dd9d" attr: "b" }
    shape_list: { fg: "#a9dd9d" attr: "b" }
    shape_literal: "#bdd0e5"
    shape_match_pattern: "#a9dd9d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#a9dd9d"
    shape_operator: "#f0aa8a"
    shape_or: { fg: "#daccf0" attr: "b" }
    shape_pipe: { fg: "#daccf0" attr: "b" }
    shape_range: { fg: "#f0aa8a" attr: "b" }
    shape_record: { fg: "#a9dd9d" attr: "b" }
    shape_redirection: { fg: "#daccf0" attr: "b" }
    shape_signature: { fg: "#a9dd9d" attr: "b" }
    shape_string: "#a9dd9d"
    shape_string_interpolation: { fg: "#a9dd9d" attr: "b" }
    shape_table: { fg: "#bdd0e5" attr: "b" }
    shape_variable: "#daccf0"

    background: "#3c4c55"
    foreground: "#ffebc3"
    cursor: "#ffebc3"
}}