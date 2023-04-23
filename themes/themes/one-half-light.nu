export def main [] { return {
    separator: "#fafafa"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#40a14f" attr: "b" }
    empty: "#0184bc"
    bool: {|| if $in { "#0997b3" } else { "light_gray" } }
    int: "#fafafa"
    filesize: {|e|
      if $e == 0b {
        "#fafafa"
      } else if $e < 1mb {
        "#0997b3"
      } else {{ fg: "#0184bc" }}
    }
    duration: "#fafafa"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#e45649" attr: "b" }
      } else if $in < 6hr {
        "#e45649"
      } else if $in < 1day {
        "#c18401"
      } else if $in < 3day {
        "#40a14f"
      } else if $in < 1wk {
        { fg: "#40a14f" attr: "b" }
      } else if $in < 6wk {
        "#0997b3"
      } else if $in < 52wk {
        "#0184bc"
      } else { "dark_gray" }
    }
    range: "#fafafa"
    float: "#fafafa"
    string: "#fafafa"
    nothing: "#fafafa"
    binary: "#fafafa"
    cellpath: "#fafafa"
    row_index: { fg: "#40a14f" attr: "b" }
    record: "#fafafa"
    list: "#fafafa"
    block: "#fafafa"
    hints: "dark_gray"

    shape_and: { fg: "#a626a4" attr: "b" }
    shape_binary: { fg: "#a626a4" attr: "b" }
    shape_block: { fg: "#0184bc" attr: "b" }
    shape_bool: "#0997b3"
    shape_custom: "#40a14f"
    shape_datetime: { fg: "#0997b3" attr: "b" }
    shape_directory: "#0997b3"
    shape_external: "#0997b3"
    shape_externalarg: { fg: "#40a14f" attr: "b" }
    shape_filepath: "#0997b3"
    shape_flag: { fg: "#0184bc" attr: "b" }
    shape_float: { fg: "#a626a4" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#0997b3" attr: "b" }
    shape_int: { fg: "#a626a4" attr: "b" }
    shape_internalcall: { fg: "#0997b3" attr: "b" }
    shape_list: { fg: "#0997b3" attr: "b" }
    shape_literal: "#0184bc"
    shape_match_pattern: "#40a14f"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#0997b3"
    shape_operator: "#c18401"
    shape_or: { fg: "#a626a4" attr: "b" }
    shape_pipe: { fg: "#a626a4" attr: "b" }
    shape_range: { fg: "#c18401" attr: "b" }
    shape_record: { fg: "#0997b3" attr: "b" }
    shape_redirection: { fg: "#a626a4" attr: "b" }
    shape_signature: { fg: "#40a14f" attr: "b" }
    shape_string: "#40a14f"
    shape_string_interpolation: { fg: "#0997b3" attr: "b" }
    shape_table: { fg: "#0184bc" attr: "b" }
    shape_variable: "#a626a4"

    background: "#fafafa"
    foreground: "#383a42"
    cursor: "#383a42"
}}