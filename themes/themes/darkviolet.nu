export def main [] { return {
    separator: "#b08ae6"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#4595e6" attr: "b" }
    empty: "#4136d9"
    bool: {|| if $in { "#40dfff" } else { "light_gray" } }
    int: "#b08ae6"
    filesize: {|e|
      if $e == 0b {
        "#b08ae6"
      } else if $e < 1mb {
        "#40dfff"
      } else {{ fg: "#4136d9" }}
    }
    duration: "#b08ae6"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#a82ee6" attr: "b" }
      } else if $in < 6hr {
        "#a82ee6"
      } else if $in < 1day {
        "#f29df2"
      } else if $in < 3day {
        "#4595e6"
      } else if $in < 1wk {
        { fg: "#4595e6" attr: "b" }
      } else if $in < 6wk {
        "#40dfff"
      } else if $in < 52wk {
        "#4136d9"
      } else { "dark_gray" }
    }
    range: "#b08ae6"
    float: "#b08ae6"
    string: "#b08ae6"
    nothing: "#b08ae6"
    binary: "#b08ae6"
    cellpath: "#b08ae6"
    row_index: { fg: "#4595e6" attr: "b" }
    record: "#b08ae6"
    list: "#b08ae6"
    block: "#b08ae6"
    hints: "dark_gray"

    shape_and: { fg: "#7e5ce6" attr: "b" }
    shape_binary: { fg: "#7e5ce6" attr: "b" }
    shape_block: { fg: "#4136d9" attr: "b" }
    shape_bool: "#40dfff"
    shape_custom: "#4595e6"
    shape_datetime: { fg: "#40dfff" attr: "b" }
    shape_directory: "#40dfff"
    shape_external: "#40dfff"
    shape_externalarg: { fg: "#4595e6" attr: "b" }
    shape_filepath: "#40dfff"
    shape_flag: { fg: "#4136d9" attr: "b" }
    shape_float: { fg: "#7e5ce6" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#40dfff" attr: "b" }
    shape_int: { fg: "#7e5ce6" attr: "b" }
    shape_internalcall: { fg: "#40dfff" attr: "b" }
    shape_list: { fg: "#40dfff" attr: "b" }
    shape_literal: "#4136d9"
    shape_match_pattern: "#4595e6"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#40dfff"
    shape_operator: "#f29df2"
    shape_or: { fg: "#7e5ce6" attr: "b" }
    shape_pipe: { fg: "#7e5ce6" attr: "b" }
    shape_range: { fg: "#f29df2" attr: "b" }
    shape_record: { fg: "#40dfff" attr: "b" }
    shape_redirection: { fg: "#7e5ce6" attr: "b" }
    shape_signature: { fg: "#4595e6" attr: "b" }
    shape_string: "#4595e6"
    shape_string_interpolation: { fg: "#40dfff" attr: "b" }
    shape_table: { fg: "#4136d9" attr: "b" }
    shape_variable: "#7e5ce6"

    background: "#000000"
    foreground: "#b08ae6"
    cursor: "#b08ae6"
}}