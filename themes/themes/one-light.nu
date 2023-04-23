export def main [] { return {
    separator: "#383a42"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#50a14f" attr: "b" }
    empty: "#4078f2"
    bool: {|| if $in { "#0184bc" } else { "light_gray" } }
    int: "#383a42"
    filesize: {|e|
      if $e == 0b {
        "#383a42"
      } else if $e < 1mb {
        "#0184bc"
      } else {{ fg: "#4078f2" }}
    }
    duration: "#383a42"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ca1243" attr: "b" }
      } else if $in < 6hr {
        "#ca1243"
      } else if $in < 1day {
        "#c18401"
      } else if $in < 3day {
        "#50a14f"
      } else if $in < 1wk {
        { fg: "#50a14f" attr: "b" }
      } else if $in < 6wk {
        "#0184bc"
      } else if $in < 52wk {
        "#4078f2"
      } else { "dark_gray" }
    }
    range: "#383a42"
    float: "#383a42"
    string: "#383a42"
    nothing: "#383a42"
    binary: "#383a42"
    cellpath: "#383a42"
    row_index: { fg: "#50a14f" attr: "b" }
    record: "#383a42"
    list: "#383a42"
    block: "#383a42"
    hints: "dark_gray"

    shape_and: { fg: "#a626a4" attr: "b" }
    shape_binary: { fg: "#a626a4" attr: "b" }
    shape_block: { fg: "#4078f2" attr: "b" }
    shape_bool: "#0184bc"
    shape_custom: "#50a14f"
    shape_datetime: { fg: "#0184bc" attr: "b" }
    shape_directory: "#0184bc"
    shape_external: "#0184bc"
    shape_externalarg: { fg: "#50a14f" attr: "b" }
    shape_filepath: "#0184bc"
    shape_flag: { fg: "#4078f2" attr: "b" }
    shape_float: { fg: "#a626a4" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#0184bc" attr: "b" }
    shape_int: { fg: "#a626a4" attr: "b" }
    shape_internalcall: { fg: "#0184bc" attr: "b" }
    shape_list: { fg: "#0184bc" attr: "b" }
    shape_literal: "#4078f2"
    shape_match_pattern: "#50a14f"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#0184bc"
    shape_operator: "#c18401"
    shape_or: { fg: "#a626a4" attr: "b" }
    shape_pipe: { fg: "#a626a4" attr: "b" }
    shape_range: { fg: "#c18401" attr: "b" }
    shape_record: { fg: "#0184bc" attr: "b" }
    shape_redirection: { fg: "#a626a4" attr: "b" }
    shape_signature: { fg: "#50a14f" attr: "b" }
    shape_string: "#50a14f"
    shape_string_interpolation: { fg: "#0184bc" attr: "b" }
    shape_table: { fg: "#4078f2" attr: "b" }
    shape_variable: "#a626a4"

    background: "#fafafa"
    foreground: "#383a42"
    cursor: "#383a42"
}}