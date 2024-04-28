# Nushell Scripts

This is a place to share Nushell scripts with each other. If you'd like to share your scripts, create a PR that adds it to the repo.

## Running Scripts

You can run nushell scripts in a few different ways.

1. You can type `nu <script name>`.
2. From with nushell, you can type `source <script name>` and if the script is just a bunch of commands it will run the script. If the script is a custom command it will load those custom commands into your current scope so you can run them like any other command.

## Included Scripts

| Category         | File                                                      | Nu Version | Description |
| ---------------- | --------------------------------------------------------- | ---------- | ----------- |
| coloring         | [color_table.nu](./coloring/color_table.nu)               | 0.26       | Produces a color table of ansi foregroupd and background colors.        |
| coloring         | [color_tables.nu](./coloring/color_tables.nu)             | 0.26       | Produces many tables with ansi foreground and background with styles        |
| coloring         | [gradient.nu](./coloring/gradient.nu)                     | 0.26       | Draws a simple blue gradient.        |
| coloring         | [nu_index_bg.nu](./coloring/nu_index_bg.nu)               | 0.26       | Draws background colors using ansi escape sequences using an index        |
| coloring         | [nu_index_fg.nu](./coloring/nu_index_fg.nu)               | 0.26       | Draws foreground colors using ansi escape sequences using an index        |
| coloring         | [nu_index_fg2.nu](./coloring/nu_index_fg2.nu)             | 0.26       | Draws foreground colors using ansi escape sequences using an index a different way       |
| coloring         | [python_index_table.nu](./coloring/python_index_table.nu) | 0.26       | Draws foreground and background colors using ansi escape sequences using an index modeled after a python script        |
| coloring         | [ref_table.nu](./coloring/ref_table.nu)                   | 0.26       | A table with row and column headers indicating the colors        |
| coloring         | [sample.nu](./coloring/sample.nu)                         | 0.26       | An exhaustive list of colors and styles using ansi escape sequences        |
| coloring         | [short_list.nu](./coloring/short_list.nu)                 | 0.26       | A small color sample that uses another nu script to define the colors by name.        |
| not assigned yet | [fehbg.nu](./fehbg.nu)                                    | >0.25.1       | Sets a random image from a directory as a wallpaper (Linux only)        |
| not assigned yet | [maintainer_time.nu](./maintainer_time.nu)                | 0.26       | Looks up time by timezone for the nushell maintainers        |
| not assigned yet | [make_readme_table.nu](./make_readme_table.nu)            | 0.26       | Generates this table.        |
| nu_101           | [demo.nu](./nu_101/demo.nu)                               | 0.26       | Creates a custom `ls` command        |
| nu_101           | [inner_outer_loop.nu](./nu_101/inner_outer_loop.nu)       | 0.26       | Demonstrates how to iterate in an inner and outer loop.        |
| parsing          | [sample_andres.nu](./parsing/sample_andres.nu)            | 0.26       | Demonstrates some json parsing.        |
| progress_bar | [percent_meter.nu](./progress_bar/percent_meter.nu)                    | 0.26       | Draws a percent meter.        |
| progress_bar | [progress_bar.nu](./progress_bar/progress_bar.nu)                      | 0.26       | Draws a progress bar        |
| progress_bar | [progress_bar_no_back.nu](./progress_bar/progress_bar_no_back.nu)      | 0.26       | Draws a progress bar with no background        |
| prompt           | [git_status_prompt.nu](./prompt/git_status_prompt.nu)     | 0.28       | Creates a prompt which includes short working directory and current git status.        |
| stdlib_candidate | [nu_style.nu](./stdlib_candidate/nu_style.nu)             | 0.26       | Define colors as names.        |
| stdlib_candidate | [print.nu](./stdlib_candidate/print.nu)                   | 0.26       | Examples of a print statement.        |
| virtual_envs     | [conda.nu](./virtual_environments/conda.nu)               | 0.32       | Activates a Conda environment. |
| virtual_envs     | [venv.nu](./virtual_environments/venv.nu)                 | 0.32       | Activates a Python venv. |
