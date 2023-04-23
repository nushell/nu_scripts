export def main [] { return {
    separator: "#f2f2f2"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#b6377d" attr: "b" }
    empty: "#a9cdeb"
    bool: {|| if $in { "#d7d9fc" } else { "light_gray" } }
    int: "#f2f2f2"
    filesize: {|e|
      if $e == 0b {
        "#f2f2f2"
      } else if $e < 1mb {
        "#c9caec"
      } else {{ fg: "#a9cdeb" }}
    }
    duration: "#f2f2f2"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#e9897c" attr: "b" }
      } else if $in < 6hr {
        "#e9897c"
      } else if $in < 1day {
        "#ecebbe"
      } else if $in < 3day {
        "#b6377d"
      } else if $in < 1wk {
        { fg: "#b6377d" attr: "b" }
      } else if $in < 6wk {
        "#c9caec"
      } else if $in < 52wk {
        "#a9cdeb"
      } else { "dark_gray" }
    }
    range: "#f2f2f2"
    float: "#f2f2f2"
    string: "#f2f2f2"
    nothing: "#f2f2f2"
    binary: "#f2f2f2"
    cellpath: "#f2f2f2"
    row_index: { fg: "#b6377d" attr: "b" }
    record: "#f2f2f2"
    list: "#f2f2f2"
    block: "#f2f2f2"
    hints: "dark_gray"

    shape_and: { fg: "#75507b" attr: "b" }
    shape_binary: { fg: "#75507b" attr: "b" }
    shape_block: { fg: "#a9cdeb" attr: "b" }
    shape_bool: "#d7d9fc"
    shape_custom: "#b6377d"
    shape_datetime: { fg: "#c9caec" attr: "b" }
    shape_directory: "#c9caec"
    shape_external: "#c9caec"
    shape_externalarg: { fg: "#b6377d" attr: "b" }
    shape_filepath: "#c9caec"
    shape_flag: { fg: "#a9cdeb" attr: "b" }
    shape_float: { fg: "#75507b" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#c9caec" attr: "b" }
    shape_int: { fg: "#75507b" attr: "b" }
    shape_internalcall: { fg: "#c9caec" attr: "b" }
    shape_list: { fg: "#c9caec" attr: "b" }
    shape_literal: "#a9cdeb"
    shape_match_pattern: "#b6377d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#d7d9fc"
    shape_operator: "#ecebbe"
    shape_or: { fg: "#75507b" attr: "b" }
    shape_pipe: { fg: "#75507b" attr: "b" }
    shape_range: { fg: "#ecebbe" attr: "b" }
    shape_record: { fg: "#c9caec" attr: "b" }
    shape_redirection: { fg: "#75507b" attr: "b" }
    shape_signature: { fg: "#b6377d" attr: "b" }
    shape_string: "#b6377d"
    shape_string_interpolation: { fg: "#c9caec" attr: "b" }
    shape_table: { fg: "#a9cdeb" attr: "b" }
    shape_variable: "#75507b"

    background: "#0a1e24"
    foreground: "#1a1a1a"
    cursor: "#1a1a1a"
}}