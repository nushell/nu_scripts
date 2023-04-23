export def main [] { return {
    separator: "#d3d7cf"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#4e9a06" attr: "b" }
    empty: "#3465a4"
    bool: {|| if $in { "#06989a" } else { "light_gray" } }
    int: "#d3d7cf"
    filesize: {|e|
      if $e == 0b {
        "#d3d7cf"
      } else if $e < 1mb {
        "#06989a"
      } else {{ fg: "#3465a4" }}
    }
    duration: "#d3d7cf"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#cc0000" attr: "b" }
      } else if $in < 6hr {
        "#cc0000"
      } else if $in < 1day {
        "#c4a000"
      } else if $in < 3day {
        "#4e9a06"
      } else if $in < 1wk {
        { fg: "#4e9a06" attr: "b" }
      } else if $in < 6wk {
        "#06989a"
      } else if $in < 52wk {
        "#3465a4"
      } else { "dark_gray" }
    }
    range: "#d3d7cf"
    float: "#d3d7cf"
    string: "#d3d7cf"
    nothing: "#d3d7cf"
    binary: "#d3d7cf"
    cellpath: "#d3d7cf"
    row_index: { fg: "#4e9a06" attr: "b" }
    record: "#d3d7cf"
    list: "#d3d7cf"
    block: "#d3d7cf"
    hints: "dark_gray"

    shape_and: { fg: "#75507b" attr: "b" }
    shape_binary: { fg: "#75507b" attr: "b" }
    shape_block: { fg: "#3465a4" attr: "b" }
    shape_bool: "#06989a"
    shape_custom: "#4e9a06"
    shape_datetime: { fg: "#06989a" attr: "b" }
    shape_directory: "#06989a"
    shape_external: "#06989a"
    shape_externalarg: { fg: "#4e9a06" attr: "b" }
    shape_filepath: "#06989a"
    shape_flag: { fg: "#3465a4" attr: "b" }
    shape_float: { fg: "#75507b" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#06989a" attr: "b" }
    shape_int: { fg: "#75507b" attr: "b" }
    shape_internalcall: { fg: "#06989a" attr: "b" }
    shape_list: { fg: "#06989a" attr: "b" }
    shape_literal: "#3465a4"
    shape_match_pattern: "#4e9a06"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#06989a"
    shape_operator: "#c4a000"
    shape_or: { fg: "#75507b" attr: "b" }
    shape_pipe: { fg: "#75507b" attr: "b" }
    shape_range: { fg: "#c4a000" attr: "b" }
    shape_record: { fg: "#06989a" attr: "b" }
    shape_redirection: { fg: "#75507b" attr: "b" }
    shape_signature: { fg: "#4e9a06" attr: "b" }
    shape_string: "#4e9a06"
    shape_string_interpolation: { fg: "#06989a" attr: "b" }
    shape_table: { fg: "#3465a4" attr: "b" }
    shape_variable: "#75507b"

    background: "#2e3436"
    foreground: "#d3d7cf"
    cursor: "#d3d7cf"
}}