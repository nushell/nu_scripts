export def main [] { return {
    separator: "#5e646f"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7c9f4b" attr: "b" }
    empty: "#6587bf"
    bool: {|| if $in { "#509c93" } else { "light_gray" } }
    int: "#5e646f"
    filesize: {|e|
      if $e == 0b {
        "#5e646f"
      } else if $e < 1mb {
        "#509c93"
      } else {{ fg: "#6587bf" }}
    }
    duration: "#5e646f"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#db7070" attr: "b" }
      } else if $in < 6hr {
        "#db7070"
      } else if $in < 1day {
        "#d69822"
      } else if $in < 3day {
        "#7c9f4b"
      } else if $in < 1wk {
        { fg: "#7c9f4b" attr: "b" }
      } else if $in < 6wk {
        "#509c93"
      } else if $in < 52wk {
        "#6587bf"
      } else { "dark_gray" }
    }
    range: "#5e646f"
    float: "#5e646f"
    string: "#5e646f"
    nothing: "#5e646f"
    binary: "#5e646f"
    cellpath: "#5e646f"
    row_index: { fg: "#7c9f4b" attr: "b" }
    record: "#5e646f"
    list: "#5e646f"
    block: "#5e646f"
    hints: "dark_gray"

    shape_and: { fg: "#b870ce" attr: "b" }
    shape_binary: { fg: "#b870ce" attr: "b" }
    shape_block: { fg: "#6587bf" attr: "b" }
    shape_bool: "#509c93"
    shape_custom: "#7c9f4b"
    shape_datetime: { fg: "#509c93" attr: "b" }
    shape_directory: "#509c93"
    shape_external: "#509c93"
    shape_externalarg: { fg: "#7c9f4b" attr: "b" }
    shape_filepath: "#509c93"
    shape_flag: { fg: "#6587bf" attr: "b" }
    shape_float: { fg: "#b870ce" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#509c93" attr: "b" }
    shape_int: { fg: "#b870ce" attr: "b" }
    shape_internalcall: { fg: "#509c93" attr: "b" }
    shape_list: { fg: "#509c93" attr: "b" }
    shape_literal: "#6587bf"
    shape_match_pattern: "#7c9f4b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#509c93"
    shape_operator: "#d69822"
    shape_or: { fg: "#b870ce" attr: "b" }
    shape_pipe: { fg: "#b870ce" attr: "b" }
    shape_range: { fg: "#d69822" attr: "b" }
    shape_record: { fg: "#509c93" attr: "b" }
    shape_redirection: { fg: "#b870ce" attr: "b" }
    shape_signature: { fg: "#7c9f4b" attr: "b" }
    shape_string: "#7c9f4b"
    shape_string_interpolation: { fg: "#509c93" attr: "b" }
    shape_table: { fg: "#6587bf" attr: "b" }
    shape_variable: "#b870ce"

    background: "#fafafa"
    foreground: "#5e646f"
    cursor: "#5e646f"
}}