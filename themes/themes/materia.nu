export def main [] { return {
    separator: "#cdd3de"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#8bd649" attr: "b" }
    empty: "#89ddff"
    bool: {|| if $in { "#80cbc4" } else { "light_gray" } }
    int: "#cdd3de"
    filesize: {|e|
      if $e == 0b {
        "#cdd3de"
      } else if $e < 1mb {
        "#80cbc4"
      } else {{ fg: "#89ddff" }}
    }
    duration: "#cdd3de"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ec5f67" attr: "b" }
      } else if $in < 6hr {
        "#ec5f67"
      } else if $in < 1day {
        "#ffcc00"
      } else if $in < 3day {
        "#8bd649"
      } else if $in < 1wk {
        { fg: "#8bd649" attr: "b" }
      } else if $in < 6wk {
        "#80cbc4"
      } else if $in < 52wk {
        "#89ddff"
      } else { "dark_gray" }
    }
    range: "#cdd3de"
    float: "#cdd3de"
    string: "#cdd3de"
    nothing: "#cdd3de"
    binary: "#cdd3de"
    cellpath: "#cdd3de"
    row_index: { fg: "#8bd649" attr: "b" }
    record: "#cdd3de"
    list: "#cdd3de"
    block: "#cdd3de"
    hints: "dark_gray"

    shape_and: { fg: "#82aaff" attr: "b" }
    shape_binary: { fg: "#82aaff" attr: "b" }
    shape_block: { fg: "#89ddff" attr: "b" }
    shape_bool: "#80cbc4"
    shape_custom: "#8bd649"
    shape_datetime: { fg: "#80cbc4" attr: "b" }
    shape_directory: "#80cbc4"
    shape_external: "#80cbc4"
    shape_externalarg: { fg: "#8bd649" attr: "b" }
    shape_filepath: "#80cbc4"
    shape_flag: { fg: "#89ddff" attr: "b" }
    shape_float: { fg: "#82aaff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#80cbc4" attr: "b" }
    shape_int: { fg: "#82aaff" attr: "b" }
    shape_internalcall: { fg: "#80cbc4" attr: "b" }
    shape_list: { fg: "#80cbc4" attr: "b" }
    shape_literal: "#89ddff"
    shape_match_pattern: "#8bd649"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#80cbc4"
    shape_operator: "#ffcc00"
    shape_or: { fg: "#82aaff" attr: "b" }
    shape_pipe: { fg: "#82aaff" attr: "b" }
    shape_range: { fg: "#ffcc00" attr: "b" }
    shape_record: { fg: "#80cbc4" attr: "b" }
    shape_redirection: { fg: "#82aaff" attr: "b" }
    shape_signature: { fg: "#8bd649" attr: "b" }
    shape_string: "#8bd649"
    shape_string_interpolation: { fg: "#80cbc4" attr: "b" }
    shape_table: { fg: "#89ddff" attr: "b" }
    shape_variable: "#82aaff"

    background: "#263238"
    foreground: "#cdd3de"
    cursor: "#cdd3de"
}}