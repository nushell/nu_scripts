# Background Colors
[40..47 100..107 49] | each { flatten } | flatten | each { |clbg|
    # Foreground Colors
    [30..37 90..97 39] | each { flatten } | flatten | each { |clfg|
        # 0 Normal
        # 1 Bold or increased intensity
        # 2 Faint or decreased intensity
        # 3 Italic (not widely supported)
        # 4 Underline
        # 5 Slow Blink < 150 per minute
        # 6 Rapid Blink > 150 per minute
        # 7 Reverse Video
        # 8 Conceal (not widely supported)
        # 9 Strike-through
        let row = (0..9 | each { |attr|
            let ansi_str = $"($attr);($clbg);($clfg)m"
            $"(ansi -e $ansi_str) ($ansi_str) (ansi reset)"
            } | str join)
        $"($row)(char newline)"
    } | str join
} | str join

# Bash Script

# #!/bin/bash
#
# # This program is free software. It comes without any warranty, to
# # the extent permitted by applicable law. You can redistribute it
# # and/or modify it under the terms of the Do What The Fuck You Want
# # To Public License, Version 2, as published by Sam Hocevar. See
# # http://sam.zoy.org/wtfpl/COPYING for more details.
#
# #Background
# for clbg in {40..47} {100..107} 49 ; do
# 	#Foreground
# 	for clfg in {30..37} {90..97} 39 ; do
# 		#Formatting
# 		for attr in 0 1 2 4 5 7 ; do
# 			#Print the result
# 			echo -en "\033[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \033[0m"
# 		done
# 		echo #Newline
# 	done
# done
#
# exit 0
