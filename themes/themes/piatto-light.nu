export def main [] { return {
    separator: "#ffffff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#66781d" attr: "b" }
    empty: "#3b5ea7"
    bool: {|| if $in { "#829428" } else { "light_gray" } }
    int: "#ffffff"
    filesize: {|e|
      if $e == 0b {
        "#ffffff"
      } else if $e < 1mb {
        "#66781d"
      } else {{ fg: "#3b5ea7" }}
    }
    duration: "#ffffff"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#b23670" attr: "b" }
      } else if $in < 6hr {
        "#b23670"
      } else if $in < 1day {
        "#cc6e33"
      } else if $in < 3day {
        "#66781d"
      } else if $in < 1wk {
        { fg: "#66781d" attr: "b" }
      } else if $in < 6wk {
        "#66781d"
      } else if $in < 52wk {
        "#3b5ea7"
      } else { "dark_gray" }
    }
    range: "#ffffff"
    float: "#ffffff"
    string: "#ffffff"
    nothing: "#ffffff"
    binary: "#ffffff"
    cellpath: "#ffffff"
    row_index: { fg: "#66781d" attr: "b" }
    record: "#ffffff"
    list: "#ffffff"
    block: "#ffffff"
    hints: "dark_gray"

    shape_and: { fg: "#a353b2" attr: "b" }
    shape_binary: { fg: "#a353b2" attr: "b" }
    shape_block: { fg: "#3b5ea7" attr: "b" }
    shape_bool: "#829428"
    shape_custom: "#66781d"
    shape_datetime: { fg: "#66781d" attr: "b" }
    shape_directory: "#66781d"
    shape_external: "#66781d"
    shape_externalarg: { fg: "#66781d" attr: "b" }
    shape_filepath: "#66781d"
    shape_flag: { fg: "#3b5ea7" attr: "b" }
    shape_float: { fg: "#a353b2" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#66781d" attr: "b" }
    shape_int: { fg: "#a353b2" attr: "b" }
    shape_internalcall: { fg: "#66781d" attr: "b" }
    shape_list: { fg: "#66781d" attr: "b" }
    shape_literal: "#3b5ea7"
    shape_match_pattern: "#66781d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#829428"
    shape_operator: "#cc6e33"
    shape_or: { fg: "#a353b2" attr: "b" }
    shape_pipe: { fg: "#a353b2" attr: "b" }
    shape_range: { fg: "#cc6e33" attr: "b" }
    shape_record: { fg: "#66781d" attr: "b" }
    shape_redirection: { fg: "#a353b2" attr: "b" }
    shape_signature: { fg: "#66781d" attr: "b" }
    shape_string: "#66781d"
    shape_string_interpolation: { fg: "#66781d" attr: "b" }
    shape_table: { fg: "#3b5ea7" attr: "b" }
    shape_variable: "#a353b2"

    background: "#ffffff"
    foreground: "#414141"
    cursor: "#5e76c7"
}}