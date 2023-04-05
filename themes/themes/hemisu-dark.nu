export def main [] { return {
    separator: "#ededed"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#b1d630" attr: "b" }
    empty: "#67bee3"
    bool: {|| if $in { "#b6e0e5" } else { "light_gray" } }
    int: "#ededed"
    filesize: {|e|
      if $e == 0b {
        "#ededed"
      } else if $e < 1mb {
        "#569a9f"
      } else {{ fg: "#67bee3" }}
    }
    duration: "#ededed"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff0054" attr: "b" }
      } else if $in < 6hr {
        "#ff0054"
      } else if $in < 1day {
        "#9d895e"
      } else if $in < 3day {
        "#b1d630"
      } else if $in < 1wk {
        { fg: "#b1d630" attr: "b" }
      } else if $in < 6wk {
        "#569a9f"
      } else if $in < 52wk {
        "#67bee3"
      } else { "dark_gray" }
    }
    range: "#ededed"
    float: "#ededed"
    string: "#ededed"
    nothing: "#ededed"
    binary: "#ededed"
    cellpath: "#ededed"
    row_index: { fg: "#b1d630" attr: "b" }
    record: "#ededed"
    list: "#ededed"
    block: "#ededed"
    hints: "dark_gray"

    shape_and: { fg: "#b576bc" attr: "b" }
    shape_binary: { fg: "#b576bc" attr: "b" }
    shape_block: { fg: "#67bee3" attr: "b" }
    shape_bool: "#b6e0e5"
    shape_custom: "#b1d630"
    shape_datetime: { fg: "#569a9f" attr: "b" }
    shape_directory: "#569a9f"
    shape_external: "#569a9f"
    shape_externalarg: { fg: "#b1d630" attr: "b" }
    shape_filepath: "#569a9f"
    shape_flag: { fg: "#67bee3" attr: "b" }
    shape_float: { fg: "#b576bc" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#569a9f" attr: "b" }
    shape_int: { fg: "#b576bc" attr: "b" }
    shape_internalcall: { fg: "#569a9f" attr: "b" }
    shape_list: { fg: "#569a9f" attr: "b" }
    shape_literal: "#67bee3"
    shape_match_pattern: "#b1d630"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#b6e0e5"
    shape_operator: "#9d895e"
    shape_or: { fg: "#b576bc" attr: "b" }
    shape_pipe: { fg: "#b576bc" attr: "b" }
    shape_range: { fg: "#9d895e" attr: "b" }
    shape_record: { fg: "#569a9f" attr: "b" }
    shape_redirection: { fg: "#b576bc" attr: "b" }
    shape_signature: { fg: "#b1d630" attr: "b" }
    shape_string: "#b1d630"
    shape_string_interpolation: { fg: "#569a9f" attr: "b" }
    shape_table: { fg: "#67bee3" attr: "b" }
    shape_variable: "#b576bc"

    background: "#000000"
    foreground: "#ffffff"
    cursor: "#baffaa"
}}