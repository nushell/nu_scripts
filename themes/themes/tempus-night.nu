export def main [] { return {
    separator: "#c4bdaf"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#52ba40" attr: "b" }
    empty: "#5aaaf2"
    bool: {|| if $in { "#00ca9a" } else { "light_gray" } }
    int: "#c4bdaf"
    filesize: {|e|
      if $e == 0b {
        "#c4bdaf"
      } else if $e < 1mb {
        "#1db5c3"
      } else {{ fg: "#5aaaf2" }}
    }
    duration: "#c4bdaf"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#fb7e8e" attr: "b" }
      } else if $in < 6hr {
        "#fb7e8e"
      } else if $in < 1day {
        "#b0a800"
      } else if $in < 3day {
        "#52ba40"
      } else if $in < 1wk {
        { fg: "#52ba40" attr: "b" }
      } else if $in < 6wk {
        "#1db5c3"
      } else if $in < 52wk {
        "#5aaaf2"
      } else { "dark_gray" }
    }
    range: "#c4bdaf"
    float: "#c4bdaf"
    string: "#c4bdaf"
    nothing: "#c4bdaf"
    binary: "#c4bdaf"
    cellpath: "#c4bdaf"
    row_index: { fg: "#52ba40" attr: "b" }
    record: "#c4bdaf"
    list: "#c4bdaf"
    block: "#c4bdaf"
    hints: "dark_gray"

    shape_and: { fg: "#ee80c0" attr: "b" }
    shape_binary: { fg: "#ee80c0" attr: "b" }
    shape_block: { fg: "#5aaaf2" attr: "b" }
    shape_bool: "#00ca9a"
    shape_custom: "#52ba40"
    shape_datetime: { fg: "#1db5c3" attr: "b" }
    shape_directory: "#1db5c3"
    shape_external: "#1db5c3"
    shape_externalarg: { fg: "#52ba40" attr: "b" }
    shape_filepath: "#1db5c3"
    shape_flag: { fg: "#5aaaf2" attr: "b" }
    shape_float: { fg: "#ee80c0" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#1db5c3" attr: "b" }
    shape_int: { fg: "#ee80c0" attr: "b" }
    shape_internalcall: { fg: "#1db5c3" attr: "b" }
    shape_list: { fg: "#1db5c3" attr: "b" }
    shape_literal: "#5aaaf2"
    shape_match_pattern: "#52ba40"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00ca9a"
    shape_operator: "#b0a800"
    shape_or: { fg: "#ee80c0" attr: "b" }
    shape_pipe: { fg: "#ee80c0" attr: "b" }
    shape_range: { fg: "#b0a800" attr: "b" }
    shape_record: { fg: "#1db5c3" attr: "b" }
    shape_redirection: { fg: "#ee80c0" attr: "b" }
    shape_signature: { fg: "#52ba40" attr: "b" }
    shape_string: "#52ba40"
    shape_string_interpolation: { fg: "#1db5c3" attr: "b" }
    shape_table: { fg: "#5aaaf2" attr: "b" }
    shape_variable: "#ee80c0"

    background: "#1a1a1a"
    foreground: "#e0e0e0"
    cursor: "#e0e0e0"
}}