export def main [] { return {
    separator: "#709080"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#60b48a" attr: "b" }
    empty: "#5555ff"
    bool: {|| if $in { "#93e0e3" } else { "light_gray" } }
    int: "#709080"
    filesize: {|e|
      if $e == 0b {
        "#709080"
      } else if $e < 1mb {
        "#8cd0d3"
      } else {{ fg: "#5555ff" }}
    }
    duration: "#709080"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#705050" attr: "b" }
      } else if $in < 6hr {
        "#705050"
      } else if $in < 1day {
        "#dfaf8f"
      } else if $in < 3day {
        "#60b48a"
      } else if $in < 1wk {
        { fg: "#60b48a" attr: "b" }
      } else if $in < 6wk {
        "#8cd0d3"
      } else if $in < 52wk {
        "#5555ff"
      } else { "dark_gray" }
    }
    range: "#709080"
    float: "#709080"
    string: "#709080"
    nothing: "#709080"
    binary: "#709080"
    cellpath: "#709080"
    row_index: { fg: "#60b48a" attr: "b" }
    record: "#709080"
    list: "#709080"
    block: "#709080"
    hints: "dark_gray"

    shape_and: { fg: "#f08cc3" attr: "b" }
    shape_binary: { fg: "#f08cc3" attr: "b" }
    shape_block: { fg: "#5555ff" attr: "b" }
    shape_bool: "#93e0e3"
    shape_custom: "#60b48a"
    shape_datetime: { fg: "#8cd0d3" attr: "b" }
    shape_directory: "#8cd0d3"
    shape_external: "#8cd0d3"
    shape_externalarg: { fg: "#60b48a" attr: "b" }
    shape_filepath: "#8cd0d3"
    shape_flag: { fg: "#5555ff" attr: "b" }
    shape_float: { fg: "#f08cc3" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#8cd0d3" attr: "b" }
    shape_int: { fg: "#f08cc3" attr: "b" }
    shape_internalcall: { fg: "#8cd0d3" attr: "b" }
    shape_list: { fg: "#8cd0d3" attr: "b" }
    shape_literal: "#5555ff"
    shape_match_pattern: "#60b48a"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#93e0e3"
    shape_operator: "#dfaf8f"
    shape_or: { fg: "#f08cc3" attr: "b" }
    shape_pipe: { fg: "#f08cc3" attr: "b" }
    shape_range: { fg: "#dfaf8f" attr: "b" }
    shape_record: { fg: "#8cd0d3" attr: "b" }
    shape_redirection: { fg: "#f08cc3" attr: "b" }
    shape_signature: { fg: "#60b48a" attr: "b" }
    shape_string: "#60b48a"
    shape_string_interpolation: { fg: "#8cd0d3" attr: "b" }
    shape_table: { fg: "#5555ff" attr: "b" }
    shape_variable: "#f08cc3"

    background: "#25234f"
    foreground: "#dcdccc"
    cursor: "#dcdccc"
}}