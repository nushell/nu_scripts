export def main [] { return {
    separator: "#fff8de"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#2ab250" attr: "b" }
    empty: "#883cdc"
    bool: {|| if $in { "#ff919d" } else { "light_gray" } }
    int: "#fff8de"
    filesize: {|e|
      if $e == 0b {
        "#fff8de"
      } else if $e < 1mb {
        "#c1b8b7"
      } else {{ fg: "#883cdc" }}
    }
    duration: "#fff8de"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#d94085" attr: "b" }
      } else if $in < 6hr {
        "#d94085"
      } else if $in < 1day {
        "#ffd16f"
      } else if $in < 3day {
        "#2ab250"
      } else if $in < 1wk {
        { fg: "#2ab250" attr: "b" }
      } else if $in < 6wk {
        "#c1b8b7"
      } else if $in < 52wk {
        "#883cdc"
      } else { "dark_gray" }
    }
    range: "#fff8de"
    float: "#fff8de"
    string: "#fff8de"
    nothing: "#fff8de"
    binary: "#fff8de"
    cellpath: "#fff8de"
    row_index: { fg: "#2ab250" attr: "b" }
    record: "#fff8de"
    list: "#fff8de"
    block: "#fff8de"
    hints: "dark_gray"

    shape_and: { fg: "#ececec" attr: "b" }
    shape_binary: { fg: "#ececec" attr: "b" }
    shape_block: { fg: "#883cdc" attr: "b" }
    shape_bool: "#ff919d"
    shape_custom: "#2ab250"
    shape_datetime: { fg: "#c1b8b7" attr: "b" }
    shape_directory: "#c1b8b7"
    shape_external: "#c1b8b7"
    shape_externalarg: { fg: "#2ab250" attr: "b" }
    shape_filepath: "#c1b8b7"
    shape_flag: { fg: "#883cdc" attr: "b" }
    shape_float: { fg: "#ececec" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#c1b8b7" attr: "b" }
    shape_int: { fg: "#ececec" attr: "b" }
    shape_internalcall: { fg: "#c1b8b7" attr: "b" }
    shape_list: { fg: "#c1b8b7" attr: "b" }
    shape_literal: "#883cdc"
    shape_match_pattern: "#2ab250"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#ff919d"
    shape_operator: "#ffd16f"
    shape_or: { fg: "#ececec" attr: "b" }
    shape_pipe: { fg: "#ececec" attr: "b" }
    shape_range: { fg: "#ffd16f" attr: "b" }
    shape_record: { fg: "#c1b8b7" attr: "b" }
    shape_redirection: { fg: "#ececec" attr: "b" }
    shape_signature: { fg: "#2ab250" attr: "b" }
    shape_string: "#2ab250"
    shape_string_interpolation: { fg: "#c1b8b7" attr: "b" }
    shape_table: { fg: "#883cdc" attr: "b" }
    shape_variable: "#ececec"

    background: "#1f1726"
    foreground: "#dafaff"
    cursor: "#dafaff"
}}