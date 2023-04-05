export def main [] { return {
    separator: "#d0d0d0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#00c918" attr: "b" }
    empty: "#3777e6"
    bool: {|| if $in { "#1faaaa" } else { "light_gray" } }
    int: "#d0d0d0"
    filesize: {|e|
      if $e == 0b {
        "#d0d0d0"
      } else if $e < 1mb {
        "#1faaaa"
      } else {{ fg: "#3777e6" }}
    }
    duration: "#d0d0d0"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff0086" attr: "b" }
      } else if $in < 6hr {
        "#ff0086"
      } else if $in < 1day {
        "#aba800"
      } else if $in < 3day {
        "#00c918"
      } else if $in < 1wk {
        { fg: "#00c918" attr: "b" }
      } else if $in < 6wk {
        "#1faaaa"
      } else if $in < 52wk {
        "#3777e6"
      } else { "dark_gray" }
    }
    range: "#d0d0d0"
    float: "#d0d0d0"
    string: "#d0d0d0"
    nothing: "#d0d0d0"
    binary: "#d0d0d0"
    cellpath: "#d0d0d0"
    row_index: { fg: "#00c918" attr: "b" }
    record: "#d0d0d0"
    list: "#d0d0d0"
    block: "#d0d0d0"
    hints: "dark_gray"

    shape_and: { fg: "#ad00a1" attr: "b" }
    shape_binary: { fg: "#ad00a1" attr: "b" }
    shape_block: { fg: "#3777e6" attr: "b" }
    shape_bool: "#1faaaa"
    shape_custom: "#00c918"
    shape_datetime: { fg: "#1faaaa" attr: "b" }
    shape_directory: "#1faaaa"
    shape_external: "#1faaaa"
    shape_externalarg: { fg: "#00c918" attr: "b" }
    shape_filepath: "#1faaaa"
    shape_flag: { fg: "#3777e6" attr: "b" }
    shape_float: { fg: "#ad00a1" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#1faaaa" attr: "b" }
    shape_int: { fg: "#ad00a1" attr: "b" }
    shape_internalcall: { fg: "#1faaaa" attr: "b" }
    shape_list: { fg: "#1faaaa" attr: "b" }
    shape_literal: "#3777e6"
    shape_match_pattern: "#00c918"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#1faaaa"
    shape_operator: "#aba800"
    shape_or: { fg: "#ad00a1" attr: "b" }
    shape_pipe: { fg: "#ad00a1" attr: "b" }
    shape_range: { fg: "#aba800" attr: "b" }
    shape_record: { fg: "#1faaaa" attr: "b" }
    shape_redirection: { fg: "#ad00a1" attr: "b" }
    shape_signature: { fg: "#00c918" attr: "b" }
    shape_string: "#00c918"
    shape_string_interpolation: { fg: "#1faaaa" attr: "b" }
    shape_table: { fg: "#3777e6" attr: "b" }
    shape_variable: "#ad00a1"

    background: "#151515"
    foreground: "#d0d0d0"
    cursor: "#d0d0d0"
}}