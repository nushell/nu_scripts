# Background Colors
echo 40..47 100..107 49 | each { |clbg|
    # Foreground Colors
    echo 30..37 90..97 39 | each { |clfg|
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
        let row = (echo 0..9 | each { |attr|
            let ansi_str = $"($attr);($clbg);($clfg)m"
            $"(ansi -e $ansi_str) ($ansi_str) (ansi reset)"
            } | str collect)
        $"($row)(char newline)" | autoview
    } | str collect
} | str collect

# Bash Script
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

# exit 0