export def main [] { return {
    separator: "#d4be98"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a9b665" attr: "b" }
    empty: "#7daea3"
    bool: {|| if $in { "#89b482" } else { "light_gray" } }
    int: "#d4be98"
    filesize: {|e|
      if $e == 0b {
        "#d4be98"
      } else if $e < 1mb {
        "#89b482"
      } else {{ fg: "#7daea3" }}
    }
    duration: "#d4be98"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ea6962" attr: "b" }
      } else if $in < 6hr {
        "#ea6962"
      } else if $in < 1day {
        "#d8a657"
      } else if $in < 3day {
        "#a9b665"
      } else if $in < 1wk {
        { fg: "#a9b665" attr: "b" }
      } else if $in < 6wk {
        "#89b482"
      } else if $in < 52wk {
        "#7daea3"
      } else { "dark_gray" }
    }
    range: "#d4be98"
    float: "#d4be98"
    string: "#d4be98"
    nothing: "#d4be98"
    binary: "#d4be98"
    cellpath: "#d4be98"
    row_index: { fg: "#a9b665" attr: "b" }
    record: "#d4be98"
    list: "#d4be98"
    block: "#d4be98"
    hints: "dark_gray"

    shape_and: { fg: "#d3869b" attr: "b" }
    shape_binary: { fg: "#d3869b" attr: "b" }
    shape_block: { fg: "#7daea3" attr: "b" }
    shape_bool: "#89b482"
    shape_custom: "#a9b665"
    shape_datetime: { fg: "#89b482" attr: "b" }
    shape_directory: "#89b482"
    shape_external: "#89b482"
    shape_externalarg: { fg: "#a9b665" attr: "b" }
    shape_filepath: "#89b482"
    shape_flag: { fg: "#7daea3" attr: "b" }
    shape_float: { fg: "#d3869b" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#89b482" attr: "b" }
    shape_int: { fg: "#d3869b" attr: "b" }
    shape_internalcall: { fg: "#89b482" attr: "b" }
    shape_list: { fg: "#89b482" attr: "b" }
    shape_literal: "#7daea3"
    shape_match_pattern: "#a9b665"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#89b482"
    shape_operator: "#d8a657"
    shape_or: { fg: "#d3869b" attr: "b" }
    shape_pipe: { fg: "#d3869b" attr: "b" }
    shape_range: { fg: "#d8a657" attr: "b" }
    shape_record: { fg: "#89b482" attr: "b" }
    shape_redirection: { fg: "#d3869b" attr: "b" }
    shape_signature: { fg: "#a9b665" attr: "b" }
    shape_string: "#a9b665"
    shape_string_interpolation: { fg: "#89b482" attr: "b" }
    shape_table: { fg: "#7daea3" attr: "b" }
    shape_variable: "#d3869b"

    background: "#32302f"
    foreground: "#d4be98"
    cursor: "#d4be98"
}}