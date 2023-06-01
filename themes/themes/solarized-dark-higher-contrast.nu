export def main [] { return {
    separator: "#eae3cb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#6cbe6c" attr: "b" }
    empty: "#2176c7"
    bool: {|| if $in { "#00b39e" } else { "light_gray" } }
    int: "#eae3cb"
    filesize: {|e|
        if $e == 0b {
            "#eae3cb"
        } else if $e < 1mb {
            "#259286"
        } else {{ fg: "#2176c7" }}
    }
    duration: "#eae3cb"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#d11c24" attr: "b" }
        } else if $in < 6hr {
            "#d11c24"
        } else if $in < 1day {
            "#a57706"
        } else if $in < 3day {
            "#6cbe6c"
        } else if $in < 1wk {
            { fg: "#6cbe6c" attr: "b" }
        } else if $in < 6wk {
            "#259286"
        } else if $in < 52wk {
            "#2176c7"
        } else { "dark_gray" }
    }
    range: "#eae3cb"
    float: "#eae3cb"
    string: "#eae3cb"
    nothing: "#eae3cb"
    binary: "#eae3cb"
    cellpath: "#eae3cb"
    row_index: { fg: "#6cbe6c" attr: "b" }
    record: "#eae3cb"
    list: "#eae3cb"
    block: "#eae3cb"
    hints: "dark_gray"
    search_result: { fg: "#d11c24" bg: "#eae3cb" }

    shape_and: { fg: "#c61c6f" attr: "b" }
    shape_binary: { fg: "#c61c6f" attr: "b" }
    shape_block: { fg: "#2176c7" attr: "b" }
    shape_bool: "#00b39e"
    shape_custom: "#6cbe6c"
    shape_datetime: { fg: "#259286" attr: "b" }
    shape_directory: "#259286"
    shape_external: "#259286"
    shape_externalarg: { fg: "#6cbe6c" attr: "b" }
    shape_filepath: "#259286"
    shape_flag: { fg: "#2176c7" attr: "b" }
    shape_float: { fg: "#c61c6f" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#259286" attr: "b" }
    shape_int: { fg: "#c61c6f" attr: "b" }
    shape_internalcall: { fg: "#259286" attr: "b" }
    shape_list: { fg: "#259286" attr: "b" }
    shape_literal: "#2176c7"
    shape_match_pattern: "#6cbe6c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00b39e"
    shape_operator: "#a57706"
    shape_or: { fg: "#c61c6f" attr: "b" }
    shape_pipe: { fg: "#c61c6f" attr: "b" }
    shape_range: { fg: "#a57706" attr: "b" }
    shape_record: { fg: "#259286" attr: "b" }
    shape_redirection: { fg: "#c61c6f" attr: "b" }
    shape_signature: { fg: "#6cbe6c" attr: "b" }
    shape_string: "#6cbe6c"
    shape_string_interpolation: { fg: "#259286" attr: "b" }
    shape_table: { fg: "#2176c7" attr: "b" }
    shape_variable: "#c61c6f"

    background: "#001e27"
    foreground: "#9cc2c3"
    cursor: "#9cc2c3"
}}