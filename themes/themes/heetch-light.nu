export def main [] { return {
    separator: "#5a496e"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#f80059" attr: "b" }
    empty: "#47f9f5"
    bool: {|| if $in { "#c33678" } else { "light_gray" } }
    int: "#5a496e"
    filesize: {|e|
      if $e == 0b {
        "#5a496e"
      } else if $e < 1mb {
        "#c33678"
      } else {{ fg: "#47f9f5" }}
    }
    duration: "#5a496e"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#27d9d5" attr: "b" }
      } else if $in < 6hr {
        "#27d9d5"
      } else if $in < 1day {
        "#5ba2b6"
      } else if $in < 3day {
        "#f80059"
      } else if $in < 1wk {
        { fg: "#f80059" attr: "b" }
      } else if $in < 6wk {
        "#c33678"
      } else if $in < 52wk {
        "#47f9f5"
      } else { "dark_gray" }
    }
    range: "#5a496e"
    float: "#5a496e"
    string: "#5a496e"
    nothing: "#5a496e"
    binary: "#5a496e"
    cellpath: "#5a496e"
    row_index: { fg: "#f80059" attr: "b" }
    record: "#5a496e"
    list: "#5a496e"
    block: "#5a496e"
    hints: "dark_gray"

    shape_and: { fg: "#bd0152" attr: "b" }
    shape_binary: { fg: "#bd0152" attr: "b" }
    shape_block: { fg: "#47f9f5" attr: "b" }
    shape_bool: "#c33678"
    shape_custom: "#f80059"
    shape_datetime: { fg: "#c33678" attr: "b" }
    shape_directory: "#c33678"
    shape_external: "#c33678"
    shape_externalarg: { fg: "#f80059" attr: "b" }
    shape_filepath: "#c33678"
    shape_flag: { fg: "#47f9f5" attr: "b" }
    shape_float: { fg: "#bd0152" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#c33678" attr: "b" }
    shape_int: { fg: "#bd0152" attr: "b" }
    shape_internalcall: { fg: "#c33678" attr: "b" }
    shape_list: { fg: "#c33678" attr: "b" }
    shape_literal: "#47f9f5"
    shape_match_pattern: "#f80059"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#c33678"
    shape_operator: "#5ba2b6"
    shape_or: { fg: "#bd0152" attr: "b" }
    shape_pipe: { fg: "#bd0152" attr: "b" }
    shape_range: { fg: "#5ba2b6" attr: "b" }
    shape_record: { fg: "#c33678" attr: "b" }
    shape_redirection: { fg: "#bd0152" attr: "b" }
    shape_signature: { fg: "#f80059" attr: "b" }
    shape_string: "#f80059"
    shape_string_interpolation: { fg: "#c33678" attr: "b" }
    shape_table: { fg: "#47f9f5" attr: "b" }
    shape_variable: "#bd0152"

    background: "#feffff"
    foreground: "#5a496e"
    cursor: "#5a496e"
}}