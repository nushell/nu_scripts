export def main [] { return {
    separator: "#504945"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#8ec07c" attr: "b" }
    empty: "#83a598"
    bool: {|| if $in { "#e9593d" } else { "light_gray" } }
    int: "#504945"
    filesize: {|e|
      if $e == 0b {
        "#504945"
      } else if $e < 1mb {
        "#e9593d"
      } else {{ fg: "#83a598" }}
    }
    duration: "#504945"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#fabd2f" attr: "b" }
      } else if $in < 6hr {
        "#fabd2f"
      } else if $in < 1day {
        "#dc9656"
      } else if $in < 3day {
        "#8ec07c"
      } else if $in < 1wk {
        { fg: "#8ec07c" attr: "b" }
      } else if $in < 6wk {
        "#e9593d"
      } else if $in < 52wk {
        "#83a598"
      } else { "dark_gray" }
    }
    range: "#504945"
    float: "#504945"
    string: "#504945"
    nothing: "#504945"
    binary: "#504945"
    cellpath: "#504945"
    row_index: { fg: "#8ec07c" attr: "b" }
    record: "#504945"
    list: "#504945"
    block: "#504945"
    hints: "dark_gray"

    shape_and: { fg: "#fe8019" attr: "b" }
    shape_binary: { fg: "#fe8019" attr: "b" }
    shape_block: { fg: "#83a598" attr: "b" }
    shape_bool: "#e9593d"
    shape_custom: "#8ec07c"
    shape_datetime: { fg: "#e9593d" attr: "b" }
    shape_directory: "#e9593d"
    shape_external: "#e9593d"
    shape_externalarg: { fg: "#8ec07c" attr: "b" }
    shape_filepath: "#e9593d"
    shape_flag: { fg: "#83a598" attr: "b" }
    shape_float: { fg: "#fe8019" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#e9593d" attr: "b" }
    shape_int: { fg: "#fe8019" attr: "b" }
    shape_internalcall: { fg: "#e9593d" attr: "b" }
    shape_list: { fg: "#e9593d" attr: "b" }
    shape_literal: "#83a598"
    shape_match_pattern: "#8ec07c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#e9593d"
    shape_operator: "#dc9656"
    shape_or: { fg: "#fe8019" attr: "b" }
    shape_pipe: { fg: "#fe8019" attr: "b" }
    shape_range: { fg: "#dc9656" attr: "b" }
    shape_record: { fg: "#e9593d" attr: "b" }
    shape_redirection: { fg: "#fe8019" attr: "b" }
    shape_signature: { fg: "#8ec07c" attr: "b" }
    shape_string: "#8ec07c"
    shape_string_interpolation: { fg: "#e9593d" attr: "b" }
    shape_table: { fg: "#83a598" attr: "b" }
    shape_variable: "#fe8019"

    background: "#1d1f21"
    foreground: "#ebdbb2"
    cursor: "#ebdbb2"
}}