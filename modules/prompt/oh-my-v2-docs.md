# oh-my.nu v2

This is less a version 2 and more of a different way of thinking. The intent of this script is to start to make oh-my.nu more configurable. We start with that by defining a lot of variables. Then we create a runtime_colors list of records. Those records will have 8bit colors, 24bit colors, or a value. 8bit for terminals like MacOS's Terminal.app and 24bit color for the rest of the world.

The thought would be that at some point this file source read another file for configured settings. That part is not done yet.

In order to use this script you need to source it and then set these.
```
$env.PROMPT_COMMAND = { (get_prompt 8bit).left_prompt }
$env.PROMPT_COMMAND_RIGHT = { (get_prompt 8bit).right_prompt }
$env.PROMPT_INDICATOR = { "" }
```

I'd love for someone to take up the torch and work on this script in order to make it better, configurable, awesome.

Below is some rough documentation on what the configuration points are and could be. Not all of these configuration points are implemented. BTW, this is a total rip-off of the fish [tide](https://github.com/IlanCosman/tide) prompt, but not as nice.


### color mode

* 24bit
* 8bit

### prompt

| Variable                   | Description                                                                                   | Type    |
| -------------------------- | --------------------------------------------------------------------------------------------- | ------- |
| add_newline_before         | print an empty line before the prompt                                                         | boolean |
| color_frame_and_connection | color of frame and prompt connection                                                          | color   |
| color_separator_same_color | color of the separator between items with the same background color                           | color   |
| icon_connection            | repeated symbol that spans gap between left and right sides of prompt                         | string  |
| min_cols                   | if using one-line prompt, Tide attempts to have at least this many columns for you to type in | integer |
| pad_items                  | if true, add a space before and after each item                                               | boolean |

| variable_name | 24bit_color | 8bit_color |
| - | - | - |
|tide_prompt_color_frame_and_connection|#6C6C6C|242|
|tide_prompt_color_separator_same_color|#949494|246|

### left_prompt

| Variable             | Description                                               | Type    |
| -------------------- | --------------------------------------------------------- | ------- |
| frame_enabled        | display the left prompt frame                             | boolean |
| items                | order of items to print in the left prompt                | list    |
| prefix               | string to put at the beginning the left prompt            | string  |
| separator_diff_color | string to separate items with different background colors | string  |
| separator_same_color | string to separate items with the same background color   | string  |
| suffix               | string to put at the end of the left prompt               | string  |

| variable_name | char |
| - | - |
|tide_left_prompt_separator_diff_color|e0b0|
|tide_left_prompt_separator_same_color|e0b1|

### right_prompt

| Variable             | Description                                               | Type    |
| -------------------- | --------------------------------------------------------- | ------- |
| frame_enabled        | display the right prompt frame                            | boolean |
| items                | order of items to print in the right prompt               | list    |
| prefix               | string to put at the beginning the right prompt           | string  |
| separator_diff_color | string to separate items with different background colors | string  |
| separator_same_color | string to separate items with the same background color   | string  |
| suffix               | string to put at the end of the right prompt              | string  |

| variable_name | char |
| - | - |
|tide_right_prompt_separator_diff_color|e0b2|
|tide_right_prompt_separator_same_color|e0b3|

### cmd_duration

| Variable  | Description                                                        | Type    |
| --------- | ------------------------------------------------------------------ | ------- |
| bg_color  | background color of the cmd_duration item                          | color   |
| color     | color of the cmd_duration item                                     | color   |
| decimals  | number of decimals to display after the seconds place              | integer |
| icon      | icon for the cmd_duration item                                     | string  |
| threshold | number of milliseconds that duration must exceed to produce output | integer |

| variable_name | 24bit_color | 8bit_color |
| - | - | - |
|tide_cmd_duration_bg_color|#C4A000|178|
|tide_cmd_duration_color|#000000|16|

### git

| Variable          | Description                                                            | Type   |
| ----------------- | ---------------------------------------------------------------------- | ------ |
| bg_color          | default background color of the git_item                               | color  |
| bg_color_unstable | background color when repository has dirty, staged, or untracked files | color  |
| bg_color_urgent   | background color when repository has conflicts or ongoing operations   | color  |
| color_branch      | color of branch/SHA                                                    | color  |
| color_conflicted  | color of conflicted files number                                       | color  |
| color_dirty       | color of dirty files number                                            | color  |
| color_operation   | color of the current operation                                         | color  |
| color_staged      | color of staged files number                                           | color  |
| color_stash       | color of stashes number                                                | color  |
| color_untracked   | color of untracked files number                                        | color  |
| color_upstream    | color of upstream behind/ahead numbers                                 | color  |
| icon              | icon of the git item, colored same as branch                           | string |

| variable_name | 24bit_color | 8bit_color |
| - | - | - |
|tide_git_bg_color|#4E9A06|70|
|tide_git_bg_color_unstable|#C4A000|178|
|tide_git_bg_color_urgent|#CC0000|160|
|tide_git_color_branch|#000000|16|
|tide_git_color_conflicted|#000000|16|
|tide_git_color_dirty|#000000|16|
|tide_git_color_operation|#000000|16|
|tide_git_color_staged|#000000|16|
|tide_git_color_stash|#000000|16|
|tide_git_color_untracked|#000000|16|
|tide_git_color_upstream|#000000|16|

### os

| Variable | Description                 | Type  |
| -------- | --------------------------- | ----- |
| bg_color | background color of os item | color |
| color    | color of os item            | color |

| variable_name | 24bit_color | 8bit_color |
| - | - | - |
|tide_os_bg_color|#CED7CF|188|
|tide_os_color|#080808|232|

### pwd

| Variable             | Description                                                                                    | Type   |
| -------------------- | ---------------------------------------------------------------------------------------------- | ------ |
| bg_color             | background color of pwd item                                                                   | color  |
| color_anchors        | color of anchor directories. These directories are displayed in bold and immune to truncation. | color  |
| color_dirs           | color of normal directories                                                                    | color  |
| color_truncated_dirs | color of truncated directories                                                                 | color  |
| icon                 | default icon for pwd item                                                                      | string |
| icon_home            | icon when the the current directory is the user's HOME                                         | string |
| icon_unwritable      | icon when the directory is not writable by the user                                            | string |
| markers              | if a directory contains any of these files/directories, it will be anchored                    | list   |

| variable_name | 24bit_color | 8bit_color |
| - | - | - |
|tide_pwd_bg_color|#3465A4|61|
|tide_pwd_color_anchors|#E4E4E4|254|
|tide_pwd_color_dirs|#E4E4E4|254|
|tide_pwd_color_truncated_dirs|#BCBCBC|250|

### rustc

| Variable | Description                              | Type   |
| -------- | ---------------------------------------- | ------ |
| bg_color | background color of rust item            | color  |
| color    | color of rust item                       | color  |
| icon     | icon to display next to the rust version | string |

| variable_name | 24bit_color | 8bit_color |
| - | - | - |
|tide_rustc_bg_color|#F74C00|202|
|tide_rustc_color|#000000|16|

### status

| Variable         | Description                         | Type   |
| ---------------- | ----------------------------------- | ------ |
| bg_color         | background color when `$status` = 0 | color  |
| bg_color_failure | background color when `$status` > 0 | color  |
| color            | color when `$status` = 0            | string |
| color_failure    | color when `$status` > 0            | color  |
| icon             | icon when `$status` = 0             | string |
| icon_failure     | icon when `$status` > 0             | string |

| variable_name | 24bit_color | 8bit_color |
| - | - | - |
|tide_status_bg_color|#2E3436|236|
|tide_status_bg_color_failure|#CC0000|160|
|tide_status_color|#4E9A06|70|
|tide_status_color_failure|#FFFF00|226|

### time

| Variable | Description                                 | Type   |
| -------- | ------------------------------------------- | ------ |
| bg_color | background color of time item               | color  |
| color    | color of time item                          | color  |
| format   | format of time item. Uses `date` formatting | string |

| variable_name | 24bit_color | 8bit_color |
| - | - | - |
|tide_time_bg_color|#D3D7CF|188|
|tide_time_color|#000000|16|
