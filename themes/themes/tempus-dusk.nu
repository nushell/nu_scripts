export def main [] { return {
    separator: "#a29899"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#8ba089" attr: "b" }
    empty: "#8c9abe"
    bool: {|| if $in { "#8caeb6" } else { "light_gray" } }
    int: "#a29899"
    filesize: {|e|
      if $e == 0b {
        "#a29899"
      } else if $e < 1mb {
        "#8e9aba"
      } else {{ fg: "#8c9abe" }}
    }
    duration: "#a29899"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#cb8d56" attr: "b" }
      } else if $in < 6hr {
        "#cb8d56"
      } else if $in < 1day {
        "#a79c46"
      } else if $in < 3day {
        "#8ba089"
      } else if $in < 1wk {
        { fg: "#8ba089" attr: "b" }
      } else if $in < 6wk {
        "#8e9aba"
      } else if $in < 52wk {
        "#8c9abe"
      } else { "dark_gray" }
    }
    range: "#a29899"
    float: "#a29899"
    string: "#a29899"
    nothing: "#a29899"
    binary: "#a29899"
    cellpath: "#a29899"
    row_index: { fg: "#8ba089" attr: "b" }
    record: "#a29899"
    list: "#a29899"
    block: "#a29899"
    hints: "dark_gray"

    shape_and: { fg: "#b190af" attr: "b" }
    shape_binary: { fg: "#b190af" attr: "b" }
    shape_block: { fg: "#8c9abe" attr: "b" }
    shape_bool: "#8caeb6"
    shape_custom: "#8ba089"
    shape_datetime: { fg: "#8e9aba" attr: "b" }
    shape_directory: "#8e9aba"
    shape_external: "#8e9aba"
    shape_externalarg: { fg: "#8ba089" attr: "b" }
    shape_filepath: "#8e9aba"
    shape_flag: { fg: "#8c9abe" attr: "b" }
    shape_float: { fg: "#b190af" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#8e9aba" attr: "b" }
    shape_int: { fg: "#b190af" attr: "b" }
    shape_internalcall: { fg: "#8e9aba" attr: "b" }
    shape_list: { fg: "#8e9aba" attr: "b" }
    shape_literal: "#8c9abe"
    shape_match_pattern: "#8ba089"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8caeb6"
    shape_operator: "#a79c46"
    shape_or: { fg: "#b190af" attr: "b" }
    shape_pipe: { fg: "#b190af" attr: "b" }
    shape_range: { fg: "#a79c46" attr: "b" }
    shape_record: { fg: "#8e9aba" attr: "b" }
    shape_redirection: { fg: "#b190af" attr: "b" }
    shape_signature: { fg: "#8ba089" attr: "b" }
    shape_string: "#8ba089"
    shape_string_interpolation: { fg: "#8e9aba" attr: "b" }
    shape_table: { fg: "#8c9abe" attr: "b" }
    shape_variable: "#b190af"

    background: "#1f252d"
    foreground: "#a2a8ba"
    cursor: "#a2a8ba"
}}