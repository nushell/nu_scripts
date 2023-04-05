export def main [] { return {
    separator: "#ab9aa9"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#34b534" attr: "b" }
    empty: "#30aeb0"
    bool: {|| if $in { "#10c480" } else { "light_gray" } }
    int: "#ab9aa9"
    filesize: {|e|
      if $e == 0b {
        "#ab9aa9"
      } else if $e < 1mb {
        "#5fad8f"
      } else {{ fg: "#30aeb0" }}
    }
    duration: "#ab9aa9"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#c19904" attr: "b" }
      } else if $in < 6hr {
        "#c19904"
      } else if $in < 1day {
        "#7fad00"
      } else if $in < 3day {
        "#34b534"
      } else if $in < 1wk {
        { fg: "#34b534" attr: "b" }
      } else if $in < 6wk {
        "#5fad8f"
      } else if $in < 52wk {
        "#30aeb0"
      } else { "dark_gray" }
    }
    range: "#ab9aa9"
    float: "#ab9aa9"
    string: "#ab9aa9"
    nothing: "#ab9aa9"
    binary: "#ab9aa9"
    cellpath: "#ab9aa9"
    row_index: { fg: "#34b534" attr: "b" }
    record: "#ab9aa9"
    list: "#ab9aa9"
    block: "#ab9aa9"
    hints: "dark_gray"

    shape_and: { fg: "#c8954c" attr: "b" }
    shape_binary: { fg: "#c8954c" attr: "b" }
    shape_block: { fg: "#30aeb0" attr: "b" }
    shape_bool: "#10c480"
    shape_custom: "#34b534"
    shape_datetime: { fg: "#5fad8f" attr: "b" }
    shape_directory: "#5fad8f"
    shape_external: "#5fad8f"
    shape_externalarg: { fg: "#34b534" attr: "b" }
    shape_filepath: "#5fad8f"
    shape_flag: { fg: "#30aeb0" attr: "b" }
    shape_float: { fg: "#c8954c" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#5fad8f" attr: "b" }
    shape_int: { fg: "#c8954c" attr: "b" }
    shape_internalcall: { fg: "#5fad8f" attr: "b" }
    shape_list: { fg: "#5fad8f" attr: "b" }
    shape_literal: "#30aeb0"
    shape_match_pattern: "#34b534"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#10c480"
    shape_operator: "#7fad00"
    shape_or: { fg: "#c8954c" attr: "b" }
    shape_pipe: { fg: "#c8954c" attr: "b" }
    shape_range: { fg: "#7fad00" attr: "b" }
    shape_record: { fg: "#5fad8f" attr: "b" }
    shape_redirection: { fg: "#c8954c" attr: "b" }
    shape_signature: { fg: "#34b534" attr: "b" }
    shape_string: "#34b534"
    shape_string_interpolation: { fg: "#5fad8f" attr: "b" }
    shape_table: { fg: "#30aeb0" attr: "b" }
    shape_variable: "#c8954c"

    background: "#162c22"
    foreground: "#bbbcbc"
    cursor: "#bbbcbc"
}}