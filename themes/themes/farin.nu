export def main [] { return {
    separator: "#cccccc"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#11ff55" attr: "b" }
    empty: "#1155ff"
    bool: {|| if $in { "#66ffdd" } else { "light_gray" } }
    int: "#cccccc"
    filesize: {|e|
      if $e == 0b {
        "#cccccc"
      } else if $e < 1mb {
        "#00ffbb"
      } else {{ fg: "#1155ff" }}
    }
    duration: "#cccccc"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff1155" attr: "b" }
      } else if $in < 6hr {
        "#ff1155"
      } else if $in < 1day {
        "#ffbb33"
      } else if $in < 3day {
        "#11ff55"
      } else if $in < 1wk {
        { fg: "#11ff55" attr: "b" }
      } else if $in < 6wk {
        "#00ffbb"
      } else if $in < 52wk {
        "#1155ff"
      } else { "dark_gray" }
    }
    range: "#cccccc"
    float: "#cccccc"
    string: "#cccccc"
    nothing: "#cccccc"
    binary: "#cccccc"
    cellpath: "#cccccc"
    row_index: { fg: "#11ff55" attr: "b" }
    record: "#cccccc"
    list: "#cccccc"
    block: "#cccccc"
    hints: "dark_gray"

    shape_and: { fg: "#ed53c9" attr: "b" }
    shape_binary: { fg: "#ed53c9" attr: "b" }
    shape_block: { fg: "#1155ff" attr: "b" }
    shape_bool: "#66ffdd"
    shape_custom: "#11ff55"
    shape_datetime: { fg: "#00ffbb" attr: "b" }
    shape_directory: "#00ffbb"
    shape_external: "#00ffbb"
    shape_externalarg: { fg: "#11ff55" attr: "b" }
    shape_filepath: "#00ffbb"
    shape_flag: { fg: "#1155ff" attr: "b" }
    shape_float: { fg: "#ed53c9" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00ffbb" attr: "b" }
    shape_int: { fg: "#ed53c9" attr: "b" }
    shape_internalcall: { fg: "#00ffbb" attr: "b" }
    shape_list: { fg: "#00ffbb" attr: "b" }
    shape_literal: "#1155ff"
    shape_match_pattern: "#11ff55"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#66ffdd"
    shape_operator: "#ffbb33"
    shape_or: { fg: "#ed53c9" attr: "b" }
    shape_pipe: { fg: "#ed53c9" attr: "b" }
    shape_range: { fg: "#ffbb33" attr: "b" }
    shape_record: { fg: "#00ffbb" attr: "b" }
    shape_redirection: { fg: "#ed53c9" attr: "b" }
    shape_signature: { fg: "#11ff55" attr: "b" }
    shape_string: "#11ff55"
    shape_string_interpolation: { fg: "#00ffbb" attr: "b" }
    shape_table: { fg: "#1155ff" attr: "b" }
    shape_variable: "#ed53c9"

    background: "#1e1e1e"
    foreground: "#aaaaaa"
    cursor: "#aaaaaa"
}}