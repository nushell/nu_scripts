export def main [] { return {
    separator: "#ccccc6"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#4df840" attr: "b" }
    empty: "#2757d6"
    bool: {|| if $in { "#23cfd5" } else { "light_gray" } }
    int: "#ccccc6"
    filesize: {|e|
      if $e == 0b {
        "#ccccc6"
      } else if $e < 1mb {
        "#38c8b5"
      } else {{ fg: "#2757d6" }}
    }
    duration: "#ccccc6"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#f92672" attr: "b" }
      } else if $in < 6hr {
        "#f92672"
      } else if $in < 1day {
        "#f4fd22"
      } else if $in < 3day {
        "#4df840"
      } else if $in < 1wk {
        { fg: "#4df840" attr: "b" }
      } else if $in < 6wk {
        "#38c8b5"
      } else if $in < 52wk {
        "#2757d6"
      } else { "dark_gray" }
    }
    range: "#ccccc6"
    float: "#ccccc6"
    string: "#ccccc6"
    nothing: "#ccccc6"
    binary: "#ccccc6"
    cellpath: "#ccccc6"
    row_index: { fg: "#4df840" attr: "b" }
    record: "#ccccc6"
    list: "#ccccc6"
    block: "#ccccc6"
    hints: "dark_gray"

    shape_and: { fg: "#8c54fe" attr: "b" }
    shape_binary: { fg: "#8c54fe" attr: "b" }
    shape_block: { fg: "#2757d6" attr: "b" }
    shape_bool: "#23cfd5"
    shape_custom: "#4df840"
    shape_datetime: { fg: "#38c8b5" attr: "b" }
    shape_directory: "#38c8b5"
    shape_external: "#38c8b5"
    shape_externalarg: { fg: "#4df840" attr: "b" }
    shape_filepath: "#38c8b5"
    shape_flag: { fg: "#2757d6" attr: "b" }
    shape_float: { fg: "#8c54fe" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#38c8b5" attr: "b" }
    shape_int: { fg: "#8c54fe" attr: "b" }
    shape_internalcall: { fg: "#38c8b5" attr: "b" }
    shape_list: { fg: "#38c8b5" attr: "b" }
    shape_literal: "#2757d6"
    shape_match_pattern: "#4df840"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#23cfd5"
    shape_operator: "#f4fd22"
    shape_or: { fg: "#8c54fe" attr: "b" }
    shape_pipe: { fg: "#8c54fe" attr: "b" }
    shape_range: { fg: "#f4fd22" attr: "b" }
    shape_record: { fg: "#38c8b5" attr: "b" }
    shape_redirection: { fg: "#8c54fe" attr: "b" }
    shape_signature: { fg: "#4df840" attr: "b" }
    shape_string: "#4df840"
    shape_string_interpolation: { fg: "#38c8b5" attr: "b" }
    shape_table: { fg: "#2757d6" attr: "b" }
    shape_variable: "#8c54fe"

    background: "#1b1d1e"
    foreground: "#f8f8f8"
    cursor: "#f8f8f8"
}}