export def main [] { return {
    separator: "#ffffff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#9fd364" attr: "b" }
    empty: "#5096be"
    bool: {|| if $in { "#d63865" } else { "light_gray" } }
    int: "#ffffff"
    filesize: {|e|
      if $e == 0b {
        "#ffffff"
      } else if $e < 1mb {
        "#d63865"
      } else {{ fg: "#5096be" }}
    }
    duration: "#ffffff"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#f18339" attr: "b" }
      } else if $in < 6hr {
        "#f18339"
      } else if $in < 1day {
        "#f4ef6d"
      } else if $in < 3day {
        "#9fd364"
      } else if $in < 1wk {
        { fg: "#9fd364" attr: "b" }
      } else if $in < 6wk {
        "#d63865"
      } else if $in < 52wk {
        "#5096be"
      } else { "dark_gray" }
    }
    range: "#ffffff"
    float: "#ffffff"
    string: "#ffffff"
    nothing: "#ffffff"
    binary: "#ffffff"
    cellpath: "#ffffff"
    row_index: { fg: "#9fd364" attr: "b" }
    record: "#ffffff"
    list: "#ffffff"
    block: "#ffffff"
    hints: "dark_gray"

    shape_and: { fg: "#695abc" attr: "b" }
    shape_binary: { fg: "#695abc" attr: "b" }
    shape_block: { fg: "#5096be" attr: "b" }
    shape_bool: "#d63865"
    shape_custom: "#9fd364"
    shape_datetime: { fg: "#d63865" attr: "b" }
    shape_directory: "#d63865"
    shape_external: "#d63865"
    shape_externalarg: { fg: "#9fd364" attr: "b" }
    shape_filepath: "#d63865"
    shape_flag: { fg: "#5096be" attr: "b" }
    shape_float: { fg: "#695abc" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#d63865" attr: "b" }
    shape_int: { fg: "#695abc" attr: "b" }
    shape_internalcall: { fg: "#d63865" attr: "b" }
    shape_list: { fg: "#d63865" attr: "b" }
    shape_literal: "#5096be"
    shape_match_pattern: "#9fd364"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#d63865"
    shape_operator: "#f4ef6d"
    shape_or: { fg: "#695abc" attr: "b" }
    shape_pipe: { fg: "#695abc" attr: "b" }
    shape_range: { fg: "#f4ef6d" attr: "b" }
    shape_record: { fg: "#d63865" attr: "b" }
    shape_redirection: { fg: "#695abc" attr: "b" }
    shape_signature: { fg: "#9fd364" attr: "b" }
    shape_string: "#9fd364"
    shape_string_interpolation: { fg: "#d63865" attr: "b" }
    shape_table: { fg: "#5096be" attr: "b" }
    shape_variable: "#695abc"

    background: "#1d1f21"
    foreground: "#b8dbef"
    cursor: "#b8dbef"
}}