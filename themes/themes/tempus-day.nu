export def main [] { return {
    separator: "#eae9dd"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#107410" attr: "b" }
    empty: "#385dc4"
    bool: {|| if $in { "#337087" } else { "light_gray" } }
    int: "#eae9dd"
    filesize: {|e|
      if $e == 0b {
        "#eae9dd"
      } else if $e < 1mb {
        "#007070"
      } else {{ fg: "#385dc4" }}
    }
    duration: "#eae9dd"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#c81000" attr: "b" }
      } else if $in < 6hr {
        "#c81000"
      } else if $in < 1day {
        "#806000"
      } else if $in < 3day {
        "#107410"
      } else if $in < 1wk {
        { fg: "#107410" attr: "b" }
      } else if $in < 6wk {
        "#007070"
      } else if $in < 52wk {
        "#385dc4"
      } else { "dark_gray" }
    }
    range: "#eae9dd"
    float: "#eae9dd"
    string: "#eae9dd"
    nothing: "#eae9dd"
    binary: "#eae9dd"
    cellpath: "#eae9dd"
    row_index: { fg: "#107410" attr: "b" }
    record: "#eae9dd"
    list: "#eae9dd"
    block: "#eae9dd"
    hints: "dark_gray"

    shape_and: { fg: "#b63052" attr: "b" }
    shape_binary: { fg: "#b63052" attr: "b" }
    shape_block: { fg: "#385dc4" attr: "b" }
    shape_bool: "#337087"
    shape_custom: "#107410"
    shape_datetime: { fg: "#007070" attr: "b" }
    shape_directory: "#007070"
    shape_external: "#007070"
    shape_externalarg: { fg: "#107410" attr: "b" }
    shape_filepath: "#007070"
    shape_flag: { fg: "#385dc4" attr: "b" }
    shape_float: { fg: "#b63052" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#007070" attr: "b" }
    shape_int: { fg: "#b63052" attr: "b" }
    shape_internalcall: { fg: "#007070" attr: "b" }
    shape_list: { fg: "#007070" attr: "b" }
    shape_literal: "#385dc4"
    shape_match_pattern: "#107410"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#337087"
    shape_operator: "#806000"
    shape_or: { fg: "#b63052" attr: "b" }
    shape_pipe: { fg: "#b63052" attr: "b" }
    shape_range: { fg: "#806000" attr: "b" }
    shape_record: { fg: "#007070" attr: "b" }
    shape_redirection: { fg: "#b63052" attr: "b" }
    shape_signature: { fg: "#107410" attr: "b" }
    shape_string: "#107410"
    shape_string_interpolation: { fg: "#007070" attr: "b" }
    shape_table: { fg: "#385dc4" attr: "b" }
    shape_variable: "#b63052"

    background: "#f8f2e5"
    foreground: "#464340"
    cursor: "#464340"
}}