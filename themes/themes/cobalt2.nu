export def main [] { return {
    separator: "#bbbbbb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#38de21" attr: "b" }
    empty: "#1460d2"
    bool: {|| if $in { "#6ae3fa" } else { "light_gray" } }
    int: "#bbbbbb"
    filesize: {|e|
      if $e == 0b {
        "#bbbbbb"
      } else if $e < 1mb {
        "#00bbbb"
      } else {{ fg: "#1460d2" }}
    }
    duration: "#bbbbbb"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff0000" attr: "b" }
      } else if $in < 6hr {
        "#ff0000"
      } else if $in < 1day {
        "#ffe50a"
      } else if $in < 3day {
        "#38de21"
      } else if $in < 1wk {
        { fg: "#38de21" attr: "b" }
      } else if $in < 6wk {
        "#00bbbb"
      } else if $in < 52wk {
        "#1460d2"
      } else { "dark_gray" }
    }
    range: "#bbbbbb"
    float: "#bbbbbb"
    string: "#bbbbbb"
    nothing: "#bbbbbb"
    binary: "#bbbbbb"
    cellpath: "#bbbbbb"
    row_index: { fg: "#38de21" attr: "b" }
    record: "#bbbbbb"
    list: "#bbbbbb"
    block: "#bbbbbb"
    hints: "dark_gray"

    shape_and: { fg: "#ff005d" attr: "b" }
    shape_binary: { fg: "#ff005d" attr: "b" }
    shape_block: { fg: "#1460d2" attr: "b" }
    shape_bool: "#6ae3fa"
    shape_custom: "#38de21"
    shape_datetime: { fg: "#00bbbb" attr: "b" }
    shape_directory: "#00bbbb"
    shape_external: "#00bbbb"
    shape_externalarg: { fg: "#38de21" attr: "b" }
    shape_filepath: "#00bbbb"
    shape_flag: { fg: "#1460d2" attr: "b" }
    shape_float: { fg: "#ff005d" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00bbbb" attr: "b" }
    shape_int: { fg: "#ff005d" attr: "b" }
    shape_internalcall: { fg: "#00bbbb" attr: "b" }
    shape_list: { fg: "#00bbbb" attr: "b" }
    shape_literal: "#1460d2"
    shape_match_pattern: "#38de21"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#6ae3fa"
    shape_operator: "#ffe50a"
    shape_or: { fg: "#ff005d" attr: "b" }
    shape_pipe: { fg: "#ff005d" attr: "b" }
    shape_range: { fg: "#ffe50a" attr: "b" }
    shape_record: { fg: "#00bbbb" attr: "b" }
    shape_redirection: { fg: "#ff005d" attr: "b" }
    shape_signature: { fg: "#38de21" attr: "b" }
    shape_string: "#38de21"
    shape_string_interpolation: { fg: "#00bbbb" attr: "b" }
    shape_table: { fg: "#1460d2" attr: "b" }
    shape_variable: "#ff005d"

    background: "#132738"
    foreground: "#ffffff"
    cursor: "#ffffff"
}}