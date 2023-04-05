export def main [] { return {
    separator: "#929181"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7d9726" attr: "b" }
    empty: "#36a166"
    bool: {|| if $in { "#5b9d48" } else { "light_gray" } }
    int: "#929181"
    filesize: {|e|
      if $e == 0b {
        "#929181"
      } else if $e < 1mb {
        "#5b9d48"
      } else {{ fg: "#36a166" }}
    }
    duration: "#929181"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ba6236" attr: "b" }
      } else if $in < 6hr {
        "#ba6236"
      } else if $in < 1day {
        "#a5980d"
      } else if $in < 3day {
        "#7d9726"
      } else if $in < 1wk {
        { fg: "#7d9726" attr: "b" }
      } else if $in < 6wk {
        "#5b9d48"
      } else if $in < 52wk {
        "#36a166"
      } else { "dark_gray" }
    }
    range: "#929181"
    float: "#929181"
    string: "#929181"
    nothing: "#929181"
    binary: "#929181"
    cellpath: "#929181"
    row_index: { fg: "#7d9726" attr: "b" }
    record: "#929181"
    list: "#929181"
    block: "#929181"
    hints: "dark_gray"

    shape_and: { fg: "#5f9182" attr: "b" }
    shape_binary: { fg: "#5f9182" attr: "b" }
    shape_block: { fg: "#36a166" attr: "b" }
    shape_bool: "#5b9d48"
    shape_custom: "#7d9726"
    shape_datetime: { fg: "#5b9d48" attr: "b" }
    shape_directory: "#5b9d48"
    shape_external: "#5b9d48"
    shape_externalarg: { fg: "#7d9726" attr: "b" }
    shape_filepath: "#5b9d48"
    shape_flag: { fg: "#36a166" attr: "b" }
    shape_float: { fg: "#5f9182" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#5b9d48" attr: "b" }
    shape_int: { fg: "#5f9182" attr: "b" }
    shape_internalcall: { fg: "#5b9d48" attr: "b" }
    shape_list: { fg: "#5b9d48" attr: "b" }
    shape_literal: "#36a166"
    shape_match_pattern: "#7d9726"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#5b9d48"
    shape_operator: "#a5980d"
    shape_or: { fg: "#5f9182" attr: "b" }
    shape_pipe: { fg: "#5f9182" attr: "b" }
    shape_range: { fg: "#a5980d" attr: "b" }
    shape_record: { fg: "#5b9d48" attr: "b" }
    shape_redirection: { fg: "#5f9182" attr: "b" }
    shape_signature: { fg: "#7d9726" attr: "b" }
    shape_string: "#7d9726"
    shape_string_interpolation: { fg: "#5b9d48" attr: "b" }
    shape_table: { fg: "#36a166" attr: "b" }
    shape_variable: "#5f9182"

    background: "#22221b"
    foreground: "#929181"
    cursor: "#929181"
}}