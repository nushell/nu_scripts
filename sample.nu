# Background Colors
echo 40..47 100..107 49 | each {
    let clbg = $it
    # Foreground Colors
    echo 30..37 90..97 39 | each {
        let clfg = $it
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
        let row = $(echo 0..9 | each {
            let attr = $it
            let ansi_str = $(echo [$(make-str $attr) ';' $(make-str $clbg) ';' $(make-str $clfg) 'm'] | str collect)
            echo [$(ansi -e $ansi_str) ' ' $ansi_str ' ' $(ansi reset)] | str collect
            } | str collect)
        echo [$row $(char newline)] | str collect | autoview
    } | str collect
} | str collect

def make-str [item] {
    echo $item | str from
}

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