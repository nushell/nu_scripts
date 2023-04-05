export def main [] { return {
    separator: "#686f9a"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#5ccc96" attr: "b" }
    empty: "#00a3cc"
    bool: {|| if $in { "#7a5ccc" } else { "light_gray" } }
    int: "#686f9a"
    filesize: {|e|
      if $e == 0b {
        "#686f9a"
      } else if $e < 1mb {
        "#7a5ccc"
      } else {{ fg: "#00a3cc" }}
    }
    duration: "#686f9a"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#e33400" attr: "b" }
      } else if $in < 6hr {
        "#e33400"
      } else if $in < 1day {
        "#b3a1e6"
      } else if $in < 3day {
        "#5ccc96"
      } else if $in < 1wk {
        { fg: "#5ccc96" attr: "b" }
      } else if $in < 6wk {
        "#7a5ccc"
      } else if $in < 52wk {
        "#00a3cc"
      } else { "dark_gray" }
    }
    range: "#686f9a"
    float: "#686f9a"
    string: "#686f9a"
    nothing: "#686f9a"
    binary: "#686f9a"
    cellpath: "#686f9a"
    row_index: { fg: "#5ccc96" attr: "b" }
    record: "#686f9a"
    list: "#686f9a"
    block: "#686f9a"
    hints: "dark_gray"

    shape_and: { fg: "#f2ce00" attr: "b" }
    shape_binary: { fg: "#f2ce00" attr: "b" }
    shape_block: { fg: "#00a3cc" attr: "b" }
    shape_bool: "#7a5ccc"
    shape_custom: "#5ccc96"
    shape_datetime: { fg: "#7a5ccc" attr: "b" }
    shape_directory: "#7a5ccc"
    shape_external: "#7a5ccc"
    shape_externalarg: { fg: "#5ccc96" attr: "b" }
    shape_filepath: "#7a5ccc"
    shape_flag: { fg: "#00a3cc" attr: "b" }
    shape_float: { fg: "#f2ce00" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#7a5ccc" attr: "b" }
    shape_int: { fg: "#f2ce00" attr: "b" }
    shape_internalcall: { fg: "#7a5ccc" attr: "b" }
    shape_list: { fg: "#7a5ccc" attr: "b" }
    shape_literal: "#00a3cc"
    shape_match_pattern: "#5ccc96"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#7a5ccc"
    shape_operator: "#b3a1e6"
    shape_or: { fg: "#f2ce00" attr: "b" }
    shape_pipe: { fg: "#f2ce00" attr: "b" }
    shape_range: { fg: "#b3a1e6" attr: "b" }
    shape_record: { fg: "#7a5ccc" attr: "b" }
    shape_redirection: { fg: "#f2ce00" attr: "b" }
    shape_signature: { fg: "#5ccc96" attr: "b" }
    shape_string: "#5ccc96"
    shape_string_interpolation: { fg: "#7a5ccc" attr: "b" }
    shape_table: { fg: "#00a3cc" attr: "b" }
    shape_variable: "#f2ce00"

    background: "#0f111b"
    foreground: "#ecf0c1"
    cursor: "#ecf0c1"
}}