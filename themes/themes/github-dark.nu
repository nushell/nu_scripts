export def main [] { return {
    separator: "#d1d5da"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#34d058" attr: "b" }
    empty: "#2188ff"
    bool: {|| if $in { "#56d4dd" } else { "light_gray" } }
    int: "#d1d5da"
    filesize: {|e|
      if $e == 0b {
        "#d1d5da"
      } else if $e < 1mb {
        "#39c5cf"
      } else {{ fg: "#2188ff" }}
    }
    duration: "#d1d5da"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ea4a5a" attr: "b" }
      } else if $in < 6hr {
        "#ea4a5a"
      } else if $in < 1day {
        "#ffea7f"
      } else if $in < 3day {
        "#34d058"
      } else if $in < 1wk {
        { fg: "#34d058" attr: "b" }
      } else if $in < 6wk {
        "#39c5cf"
      } else if $in < 52wk {
        "#2188ff"
      } else { "dark_gray" }
    }
    range: "#d1d5da"
    float: "#d1d5da"
    string: "#d1d5da"
    nothing: "#d1d5da"
    binary: "#d1d5da"
    cellpath: "#d1d5da"
    row_index: { fg: "#34d058" attr: "b" }
    record: "#d1d5da"
    list: "#d1d5da"
    block: "#d1d5da"
    hints: "dark_gray"

    shape_and: { fg: "#b392f0" attr: "b" }
    shape_binary: { fg: "#b392f0" attr: "b" }
    shape_block: { fg: "#2188ff" attr: "b" }
    shape_bool: "#56d4dd"
    shape_custom: "#34d058"
    shape_datetime: { fg: "#39c5cf" attr: "b" }
    shape_directory: "#39c5cf"
    shape_external: "#39c5cf"
    shape_externalarg: { fg: "#34d058" attr: "b" }
    shape_filepath: "#39c5cf"
    shape_flag: { fg: "#2188ff" attr: "b" }
    shape_float: { fg: "#b392f0" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#39c5cf" attr: "b" }
    shape_int: { fg: "#b392f0" attr: "b" }
    shape_internalcall: { fg: "#39c5cf" attr: "b" }
    shape_list: { fg: "#39c5cf" attr: "b" }
    shape_literal: "#2188ff"
    shape_match_pattern: "#34d058"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#56d4dd"
    shape_operator: "#ffea7f"
    shape_or: { fg: "#b392f0" attr: "b" }
    shape_pipe: { fg: "#b392f0" attr: "b" }
    shape_range: { fg: "#ffea7f" attr: "b" }
    shape_record: { fg: "#39c5cf" attr: "b" }
    shape_redirection: { fg: "#b392f0" attr: "b" }
    shape_signature: { fg: "#34d058" attr: "b" }
    shape_string: "#34d058"
    shape_string_interpolation: { fg: "#39c5cf" attr: "b" }
    shape_table: { fg: "#2188ff" attr: "b" }
    shape_variable: "#b392f0"

    background: "#24292e"
    foreground: "#d1d5da"
    cursor: "#c8e1ff"
}}