export def main [] { return {
    separator: "#9ea7a6"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#237986" attr: "b" }
    empty: "#484d79"
    bool: {|| if $in { "#b02f30" } else { "light_gray" } }
    int: "#9ea7a6"
    filesize: {|e|
      if $e == 0b {
        "#9ea7a6"
      } else if $e < 1mb {
        "#b02f30"
      } else {{ fg: "#484d79" }}
    }
    duration: "#9ea7a6"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#2a5491" attr: "b" }
      } else if $in < 6hr {
        "#2a5491"
      } else if $in < 1day {
        "#a03b1e"
      } else if $in < 3day {
        "#237986"
      } else if $in < 1wk {
        { fg: "#237986" attr: "b" }
      } else if $in < 6wk {
        "#b02f30"
      } else if $in < 52wk {
        "#484d79"
      } else { "dark_gray" }
    }
    range: "#9ea7a6"
    float: "#9ea7a6"
    string: "#9ea7a6"
    nothing: "#9ea7a6"
    binary: "#9ea7a6"
    cellpath: "#9ea7a6"
    row_index: { fg: "#237986" attr: "b" }
    record: "#9ea7a6"
    list: "#9ea7a6"
    block: "#9ea7a6"
    hints: "dark_gray"

    shape_and: { fg: "#c59820" attr: "b" }
    shape_binary: { fg: "#c59820" attr: "b" }
    shape_block: { fg: "#484d79" attr: "b" }
    shape_bool: "#b02f30"
    shape_custom: "#237986"
    shape_datetime: { fg: "#b02f30" attr: "b" }
    shape_directory: "#b02f30"
    shape_external: "#b02f30"
    shape_externalarg: { fg: "#237986" attr: "b" }
    shape_filepath: "#b02f30"
    shape_flag: { fg: "#484d79" attr: "b" }
    shape_float: { fg: "#c59820" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#b02f30" attr: "b" }
    shape_int: { fg: "#c59820" attr: "b" }
    shape_internalcall: { fg: "#b02f30" attr: "b" }
    shape_list: { fg: "#b02f30" attr: "b" }
    shape_literal: "#484d79"
    shape_match_pattern: "#237986"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#b02f30"
    shape_operator: "#a03b1e"
    shape_or: { fg: "#c59820" attr: "b" }
    shape_pipe: { fg: "#c59820" attr: "b" }
    shape_range: { fg: "#a03b1e" attr: "b" }
    shape_record: { fg: "#b02f30" attr: "b" }
    shape_redirection: { fg: "#c59820" attr: "b" }
    shape_signature: { fg: "#237986" attr: "b" }
    shape_string: "#237986"
    shape_string_interpolation: { fg: "#b02f30" attr: "b" }
    shape_table: { fg: "#484d79" attr: "b" }
    shape_variable: "#c59820"

    background: "#232c31"
    foreground: "#9ea7a6"
    cursor: "#9ea7a6"
}}