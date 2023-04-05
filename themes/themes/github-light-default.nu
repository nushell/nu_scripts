export def main [] { return {
    separator: "#6e7781"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#116329" attr: "b" }
    empty: "#0969da"
    bool: {|| if $in { "#3192aa" } else { "light_gray" } }
    int: "#6e7781"
    filesize: {|e|
      if $e == 0b {
        "#6e7781"
      } else if $e < 1mb {
        "#1b7c83"
      } else {{ fg: "#0969da" }}
    }
    duration: "#6e7781"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#cf222e" attr: "b" }
      } else if $in < 6hr {
        "#cf222e"
      } else if $in < 1day {
        "#4d2d00"
      } else if $in < 3day {
        "#116329"
      } else if $in < 1wk {
        { fg: "#116329" attr: "b" }
      } else if $in < 6wk {
        "#1b7c83"
      } else if $in < 52wk {
        "#0969da"
      } else { "dark_gray" }
    }
    range: "#6e7781"
    float: "#6e7781"
    string: "#6e7781"
    nothing: "#6e7781"
    binary: "#6e7781"
    cellpath: "#6e7781"
    row_index: { fg: "#116329" attr: "b" }
    record: "#6e7781"
    list: "#6e7781"
    block: "#6e7781"
    hints: "dark_gray"

    shape_and: { fg: "#8250df" attr: "b" }
    shape_binary: { fg: "#8250df" attr: "b" }
    shape_block: { fg: "#0969da" attr: "b" }
    shape_bool: "#3192aa"
    shape_custom: "#116329"
    shape_datetime: { fg: "#1b7c83" attr: "b" }
    shape_directory: "#1b7c83"
    shape_external: "#1b7c83"
    shape_externalarg: { fg: "#116329" attr: "b" }
    shape_filepath: "#1b7c83"
    shape_flag: { fg: "#0969da" attr: "b" }
    shape_float: { fg: "#8250df" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#1b7c83" attr: "b" }
    shape_int: { fg: "#8250df" attr: "b" }
    shape_internalcall: { fg: "#1b7c83" attr: "b" }
    shape_list: { fg: "#1b7c83" attr: "b" }
    shape_literal: "#0969da"
    shape_match_pattern: "#116329"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#3192aa"
    shape_operator: "#4d2d00"
    shape_or: { fg: "#8250df" attr: "b" }
    shape_pipe: { fg: "#8250df" attr: "b" }
    shape_range: { fg: "#4d2d00" attr: "b" }
    shape_record: { fg: "#1b7c83" attr: "b" }
    shape_redirection: { fg: "#8250df" attr: "b" }
    shape_signature: { fg: "#116329" attr: "b" }
    shape_string: "#116329"
    shape_string_interpolation: { fg: "#1b7c83" attr: "b" }
    shape_table: { fg: "#0969da" attr: "b" }
    shape_variable: "#8250df"

    background: "#ffffff"
    foreground: "#0E1116"
    cursor: "#044289"
}}