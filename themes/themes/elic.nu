export def main [] { return {
    separator: "#2aa7e7"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#6ab017" attr: "b" }
    empty: "#729fcf"
    bool: {|| if $in { "#4bb8fd" } else { "light_gray" } }
    int: "#2aa7e7"
    filesize: {|e|
      if $e == 0b {
        "#2aa7e7"
      } else if $e < 1mb {
        "#f2f2f2"
      } else {{ fg: "#729fcf" }}
    }
    duration: "#2aa7e7"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#e1321a" attr: "b" }
      } else if $in < 6hr {
        "#e1321a"
      } else if $in < 1day {
        "#ffc005"
      } else if $in < 3day {
        "#6ab017"
      } else if $in < 1wk {
        { fg: "#6ab017" attr: "b" }
      } else if $in < 6wk {
        "#f2f2f2"
      } else if $in < 52wk {
        "#729fcf"
      } else { "dark_gray" }
    }
    range: "#2aa7e7"
    float: "#2aa7e7"
    string: "#2aa7e7"
    nothing: "#2aa7e7"
    binary: "#2aa7e7"
    cellpath: "#2aa7e7"
    row_index: { fg: "#6ab017" attr: "b" }
    record: "#2aa7e7"
    list: "#2aa7e7"
    block: "#2aa7e7"
    hints: "dark_gray"

    shape_and: { fg: "#ec0048" attr: "b" }
    shape_binary: { fg: "#ec0048" attr: "b" }
    shape_block: { fg: "#729fcf" attr: "b" }
    shape_bool: "#4bb8fd"
    shape_custom: "#6ab017"
    shape_datetime: { fg: "#f2f2f2" attr: "b" }
    shape_directory: "#f2f2f2"
    shape_external: "#f2f2f2"
    shape_externalarg: { fg: "#6ab017" attr: "b" }
    shape_filepath: "#f2f2f2"
    shape_flag: { fg: "#729fcf" attr: "b" }
    shape_float: { fg: "#ec0048" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#f2f2f2" attr: "b" }
    shape_int: { fg: "#ec0048" attr: "b" }
    shape_internalcall: { fg: "#f2f2f2" attr: "b" }
    shape_list: { fg: "#f2f2f2" attr: "b" }
    shape_literal: "#729fcf"
    shape_match_pattern: "#6ab017"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#4bb8fd"
    shape_operator: "#ffc005"
    shape_or: { fg: "#ec0048" attr: "b" }
    shape_pipe: { fg: "#ec0048" attr: "b" }
    shape_range: { fg: "#ffc005" attr: "b" }
    shape_record: { fg: "#f2f2f2" attr: "b" }
    shape_redirection: { fg: "#ec0048" attr: "b" }
    shape_signature: { fg: "#6ab017" attr: "b" }
    shape_string: "#6ab017"
    shape_string_interpolation: { fg: "#f2f2f2" attr: "b" }
    shape_table: { fg: "#729fcf" attr: "b" }
    shape_variable: "#ec0048"

    background: "#4a453e"
    foreground: "#f2f2f2"
    cursor: "#f2f2f2"
}}