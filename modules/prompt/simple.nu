export def create_left_prompt [] {
    let path_segment = if (is-admin) {
        $"(ansi red_bold)($env.PWD)"
    } else {
        $"(ansi green_bold)($env.PWD)"
    }
    let duration_segment = do {
        let duration_secs = ($env.CMD_DURATION_MS | into int) / 1000
        if ($duration_secs >= 5) {
            $"(ansi yellow_bold)($duration_secs | math round | into string | append "sec" | str join | into duration) "
        } else {
            ""
        }
    }
    let exit_code_segment = if ($env.LAST_EXIT_CODE == 0) {
        ""
    } else {
        $"(ansi red_bold)($env.LAST_EXIT_CODE) "
    }

    [$duration_segment, $exit_code_segment, $path_segment] | str join
}
