#!/bin/bash
#
# generates an 8 bit color table (256 colors) for reference,
# using the ANSI CSI+SGR \033[48;5;${val}m for background and
# \033[38;5;${val}m for text (see "ANSI Code" on Wikipedia)
#
echo -en "\n   +  "
for i in {0..35}; do
printf "%2b " $i
done
printf "\n\n %3b  " 0
for i in {0..15}; do
    echo -en "\033[48;5;${i}m  \033[m "
done
#for i in 16 52 88 124 160 196 232; do
for i in {0..6}; do
    let "i = i*36 +16"
    printf "\n\n %3b  " $i
    for j in {0..35}; do
        let "val = i+j"
        echo -en "\033[48;5;${val}m  \033[m "
    done
done
echo -e "\n"
