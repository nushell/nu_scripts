source ../stdlib_candidate/nu_style.nu

# # Regular Colors
$"  Regular Colors (char newline) (char newline)"
# | Value    | Color  |
# | -------- | ------ |
# | \e[0;30m | Black  |
# | \e[0;31m | Red    |
# | \e[0;32m | Green  |
# | \e[0;33m | Yellow |
# | \e[0;34m | Blue   |
# | \e[0;35m | Purple |
# | \e[0;36m | Cyan   |
# | \e[0;37m | White  |
$"| Value | Color  | Name      | (char newline)"
$"| ----- | -----  | --------- | (char newline)"
$"| (fg_black)0;30m(relet) | Black  | fg_black  | (char newline)"
$"| (fg_red)0;31m(relet) | Red    | fg_red    | (char newline)"
$"| (fg_green)0;32m(relet) | Green  | fg_green  | (char newline)"
$"| (fg_yellow)0;33m(relet) | Yellow | fg_yellow | (char newline)"
$"| (fg_blue)0;34m(relet) | Blue   | fg_blue   | (char newline)"
$"| (fg_purple)0;35m(relet) | Purple | fg_purple | (char newline)"
$"| (fg_cyan)0;36m(relet) | Cyan   | fg_cyan   | (char newline)"
$"| (fg_white)0;37m(relet) | White  | fg_white  | (char newline)"
char newline

# # Bold
$"  Bold Colors (char newline) (char newline)"

# | Value    | Color    |
# | -------- | -------- |
# | \e[1;30m | Black    |
# | \e[1;31m | Red      |
# | \e[1;32m | Green    |
# | \e[1;33m | Yellow   |
# | \e[1;34m | Blue     |
# | \e[1;35m | Purple   |
# | \e[1;36m | Cyan     |
# | \e[1;37m | White    |
# | \e[1m    | No Color |
$"| Value | Color  | (char newline)"
$"| ----- | -----  | (char newline)"
$"| (fg_black)(bold_on)1;30m(relet) | Black  | (char newline)"
$"| (fg_red)(bold_on)1;31m(relet) | Red    | (char newline)"
$"| (fg_green)(bold_on)1;32m(relet) | Green  | (char newline)"
$"| (fg_yellow)(bold_on)1;33m(relet) | Yellow | (char newline)"
$"| (fg_blue)(bold_on)1;34m(relet) | Blue   | (char newline)"
$"| (fg_purple)(bold_on)1;35m(relet) | Purple | (char newline)"
$"| (fg_cyan)(bold_on)1;36m(relet) | Cyan   | (char newline)"
$"| (fg_white)(bold_on)1;37m(relet) | White  | (char newline)"
char newline

# # Underline
$" Underline Colors (char newline) (char newline)"

# | Value    | Color    |
# | -------- | -------- |
# | \e[4;30m | Black    |
# | \e[4;31m | Red      |
# | \e[4;32m | Green    |
# | \e[4;33m | Yellow   |
# | \e[4;34m | Blue     |
# | \e[4;35m | Purple   |
# | \e[4;36m | Cyan     |
# | \e[4;37m | White    |
# | \e[4m    | No Color |
$"| Value | Color  | (char newline)"
$"| ----- | -----  | (char newline)"
$"| (fg_black)(underline_on)4;30m(relet) | Black  | (char newline)"
$"| (fg_red)(underline_on)4;31m(relet) | Red    | (char newline)"
$"| (fg_green)(underline_on)4;32m(relet) | Green  | (char newline)"
$"| (fg_yellow)(underline_on)4;33m(relet) | Yellow | (char newline)"
$"| (fg_blue)(underline_on)4;34m(relet) | Blue   | (char newline)"
$"| (fg_purple)(underline_on)4;35m(relet) | Purple | (char newline)"
$"| (fg_cyan)(underline_on)4;36m(relet) | Cyan   | (char newline)"
$"| (fg_white)(underline_on)4;37m(relet) | White  | (char newline)"
char newline

# # Background
$" Background Colors (char newline) (char newline)"

# | Value  | Color  |
# | ------ | ------ |
# | \e[40m | Black  |
# | \e[41m | Red    |
# | \e[42m | Green  |
# | \e[43m | Yellow |
# | \e[44m | Blue   |
# | \e[45m | Purple |
# | \e[46m | Cyan   |
# | \e[47m | White  |
$"| Value | Color  | (char newline)"
$"| ----- | -----  | (char newline)"
$"| (bg_black)0;40m(relet)| Black   | (char newline)"
$"| (bg_red)0;41m(relet)| Red     | (char newline)"
$"| (bg_green)0;42m(relet)| Green   | (char newline)"
$"| (bg_yellow)0;43m(relet)| Yellow  | (char newline)"
$"| (bg_blue)0;44m(relet)| Blue    | (char newline)"
$"| (bg_purple)0;45m(relet)| Purple  | (char newline)"
$"| (bg_cyan)0;46m(relet)| Cyan    | (char newline)"
$"| (bg_white)0;47m(relet)| White   | (char newline)"
char newline

# # Expand Background Horizontally

# | Value |   Color  |
# | ----- | -------- |
# | \e[K  | No Color |

# # High Intensty
$" High Intensity (char newline) (char newline)"

# | Value    | Color  |
# | -------- | ------ |
# | \e[0;90m | Black  |
# | \e[0;91m | Red    |
# | \e[0;92m | Green  |
# | \e[0;93m | Yellow |
# | \e[0;94m | Blue   |
# | \e[0;95m | Purple |
# | \e[0;96m | Cyan   |
# | \e[0;97m | White  |
$"| Value | Color  | (char newline)"
$"| ----- | -----  | (char newline)"
$"| (fg_light_black)0;90m(relet) | Black  | (char newline)"
$"| (fg_light_red)0;91m(relet) | Red    | (char newline)"
$"| (fg_light_green)0;92m(relet) | Green  | (char newline)"
$"| (fg_light_yellow)0;93m(relet) | Yellow | (char newline)"
$"| (fg_light_blue)0;94m(relet) | Blue   | (char newline)"
$"| (fg_light_purple)0;95m(relet) | Purple | (char newline)"
$"| (fg_light_cyan)0;96m(relet) | Cyan   | (char newline)"
$"| (fg_light_white)0;97m(relet) | White  | (char newline)"
char newline

# # Bold High Intensty
$" Bold High Intensity (char newline) (char newline)"

# | Value    | Color  |
# | -------- | ------ |
# | \e[1;90m | Black  |
# | \e[1;91m | Red    |
# | \e[1;92m | Green  |
# | \e[1;93m | Yellow |
# | \e[1;94m | Blue   |
# | \e[1;95m | Purple |
# | \e[1;96m | Cyan   |
# | \e[1;97m | White  |
$"| Value | Color  | (char newline)"
$"| ----- | -----  | (char newline)"
$"| (fg_light_black)(bold_on)1;90m(relet) | Black  | (char newline)"
$"| (fg_light_red)(bold_on)1;91m(relet) | Red    | (char newline)"
$"| (fg_light_green)(bold_on)1;92m(relet) | Green  | (char newline)"
$"| (fg_light_yellow)(bold_on)1;93m(relet) | Yellow | (char newline)"
$"| (fg_light_blue)(bold_on)1;94m(relet) | Blue   | (char newline)"
$"| (fg_light_purple)(bold_on)1;95m(relet) | Purple | (char newline)"
$"| (fg_light_cyan)(bold_on)1;96m(relet) | Cyan   | (char newline)"
$"| (fg_light_white)(bold_on)1;97m(relet) | White  | (char newline)"
char newline

# # High Intensty backgrounds
$" High Intensity backgrounds (char newline) (char newline)"

# | Value     | Color  |
# | --------- | ------ |
# | \e[0;100m | Black  |
# | \e[0;101m | Red    |
# | \e[0;102m | Green  |
# | \e[0;103m | Yellow |
# | \e[0;104m | Blue   |
# | \e[0;105m | Purple |
# | \e[0;106m | Cyan   |
# | \e[0;107m | White  |
$"| Value  | Color  | (char newline)"
$"| -----  | -----  | (char newline)"
$"| (bg_light_black)0;100m(relet) | Black  | (char newline)"
$"| (bg_light_red)0;101m(relet) | Red    | (char newline)"
$"| (bg_light_green)0;102m(relet) | Green  | (char newline)"
$"| (bg_light_yellow)0;103m(relet) | Yellow | (char newline)"
$"| (bg_light_blue)0;104m(relet) | Blue   | (char newline)"
$"| (bg_light_purple)0;105m(relet) | Purple | (char newline)"
$"| (bg_light_cyan)0;106m(relet) | Cyan   | (char newline)"
$"| (bg_light_white)0;107m(relet) | White  | (char newline)"
char newline

# # Reset

# | Value | Color  |
# | ----- | ------ |
# | \e[0m | Reset  |