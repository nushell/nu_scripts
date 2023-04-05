export def main [] { return {
    separator: "#e5c6aa"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#85c54c" attr: "b" }
    empty: "#1398b9"
    bool: {|| if $in { "#84f088" } else { "light_gray" } }
    int: "#e5c6aa"
    filesize: {|e|
      if $e == 0b {
        "#e5c6aa"
      } else if $e < 1mb {
        "#509552"
      } else {{ fg: "#1398b9" }}
    }
    duration: "#e5c6aa"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#c94234" attr: "b" }
      } else if $in < 6hr {
        "#c94234"
      } else if $in < 1day {
        "#f5ae2e"
      } else if $in < 3day {
        "#85c54c"
      } else if $in < 1wk {
        { fg: "#85c54c" attr: "b" }
      } else if $in < 6wk {
        "#509552"
      } else if $in < 52wk {
        "#1398b9"
      } else { "dark_gray" }
    }
    range: "#e5c6aa"
    float: "#e5c6aa"
    string: "#e5c6aa"
    nothing: "#e5c6aa"
    binary: "#e5c6aa"
    cellpath: "#e5c6aa"
    row_index: { fg: "#85c54c" attr: "b" }
    record: "#e5c6aa"
    list: "#e5c6aa"
    block: "#e5c6aa"
    hints: "dark_gray"

    shape_and: { fg: "#d0633d" attr: "b" }
    shape_binary: { fg: "#d0633d" attr: "b" }
    shape_block: { fg: "#1398b9" attr: "b" }
    shape_bool: "#84f088"
    shape_custom: "#85c54c"
    shape_datetime: { fg: "#509552" attr: "b" }
    shape_directory: "#509552"
    shape_external: "#509552"
    shape_externalarg: { fg: "#85c54c" attr: "b" }
    shape_filepath: "#509552"
    shape_flag: { fg: "#1398b9" attr: "b" }
    shape_float: { fg: "#d0633d" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#509552" attr: "b" }
    shape_int: { fg: "#d0633d" attr: "b" }
    shape_internalcall: { fg: "#509552" attr: "b" }
    shape_list: { fg: "#509552" attr: "b" }
    shape_literal: "#1398b9"
    shape_match_pattern: "#85c54c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#84f088"
    shape_operator: "#f5ae2e"
    shape_or: { fg: "#d0633d" attr: "b" }
    shape_pipe: { fg: "#d0633d" attr: "b" }
    shape_range: { fg: "#f5ae2e" attr: "b" }
    shape_record: { fg: "#509552" attr: "b" }
    shape_redirection: { fg: "#d0633d" attr: "b" }
    shape_signature: { fg: "#85c54c" attr: "b" }
    shape_string: "#85c54c"
    shape_string_interpolation: { fg: "#509552" attr: "b" }
    shape_table: { fg: "#1398b9" attr: "b" }
    shape_variable: "#d0633d"

    background: "#292520"
    foreground: "#e5c7a9"
    cursor: "#e5c7a9"
}}