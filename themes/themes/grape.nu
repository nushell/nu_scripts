export def main [] { return {
    separator: "#9e9ea0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#1fa91b" attr: "b" }
    empty: "#487df4"
    bool: {|| if $in { "#9de3eb" } else { "light_gray" } }
    int: "#9e9ea0"
    filesize: {|e|
      if $e == 0b {
        "#9e9ea0"
      } else if $e < 1mb {
        "#3bdeed"
      } else {{ fg: "#487df4" }}
    }
    duration: "#9e9ea0"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ed2261" attr: "b" }
      } else if $in < 6hr {
        "#ed2261"
      } else if $in < 1day {
        "#8ddc20"
      } else if $in < 3day {
        "#1fa91b"
      } else if $in < 1wk {
        { fg: "#1fa91b" attr: "b" }
      } else if $in < 6wk {
        "#3bdeed"
      } else if $in < 52wk {
        "#487df4"
      } else { "dark_gray" }
    }
    range: "#9e9ea0"
    float: "#9e9ea0"
    string: "#9e9ea0"
    nothing: "#9e9ea0"
    binary: "#9e9ea0"
    cellpath: "#9e9ea0"
    row_index: { fg: "#1fa91b" attr: "b" }
    record: "#9e9ea0"
    list: "#9e9ea0"
    block: "#9e9ea0"
    hints: "dark_gray"

    shape_and: { fg: "#8d35c9" attr: "b" }
    shape_binary: { fg: "#8d35c9" attr: "b" }
    shape_block: { fg: "#487df4" attr: "b" }
    shape_bool: "#9de3eb"
    shape_custom: "#1fa91b"
    shape_datetime: { fg: "#3bdeed" attr: "b" }
    shape_directory: "#3bdeed"
    shape_external: "#3bdeed"
    shape_externalarg: { fg: "#1fa91b" attr: "b" }
    shape_filepath: "#3bdeed"
    shape_flag: { fg: "#487df4" attr: "b" }
    shape_float: { fg: "#8d35c9" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#3bdeed" attr: "b" }
    shape_int: { fg: "#8d35c9" attr: "b" }
    shape_internalcall: { fg: "#3bdeed" attr: "b" }
    shape_list: { fg: "#3bdeed" attr: "b" }
    shape_literal: "#487df4"
    shape_match_pattern: "#1fa91b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#9de3eb"
    shape_operator: "#8ddc20"
    shape_or: { fg: "#8d35c9" attr: "b" }
    shape_pipe: { fg: "#8d35c9" attr: "b" }
    shape_range: { fg: "#8ddc20" attr: "b" }
    shape_record: { fg: "#3bdeed" attr: "b" }
    shape_redirection: { fg: "#8d35c9" attr: "b" }
    shape_signature: { fg: "#1fa91b" attr: "b" }
    shape_string: "#1fa91b"
    shape_string_interpolation: { fg: "#3bdeed" attr: "b" }
    shape_table: { fg: "#487df4" attr: "b" }
    shape_variable: "#8d35c9"

    background: "#171423"
    foreground: "#9f9fa1"
    cursor: "#9f9fa1"
}}