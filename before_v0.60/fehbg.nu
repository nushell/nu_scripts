#!/usr/bin/env nu
#
# ~/.fehbg.nu
#
# This script selects a random image from a directory and sets it as a
# wallpaper. An additional feature is that it draws the path of the image in
# the lower left corner which makes it easier to find the image later.
#
# The procedure is as follows::
# * Select a random image from a directory (recursively entering all
#   subdirectories)
# * Print the path of the image as an overlay on top of the selected image
# * Save the result in a temporary file
# * Set the temporary image as a wallpaper.
#
# !! Requires `WALLPAPER_DIR` and `TMP_DIR` environment variables to be set !!
#    (or just hardcode your own paths below)
#
# You can set this script to run on desktop startup, e.g., by adding it to
# xinitrc.
#
# Dependencies;
# * nu version  >=0.32.0 (tested on 0.36.0)
# * feh
# * imagemagick

# Path definitions
let img_dir = $nu.env.WALLPAPER_DIR
let tmp_image = (echo [ $nu.env.TMP_DIR "wallpaper.jpg" ] | path join)

# Monitor resolution
let resolution_y = 1440

# Position of the caption
let pos_x = 5
let pos_y = 0.995 * $resolution_y

# Helper commands
def select_random [] { shuffle | first }

# List all images in a directory and all its subdirectories
def list_images [dir] {
    ls (build-string $dir /**/*) | where type == File | where name =~ jpg or name =~ jpeg or name =~ tif or name =~ tiff
}

# Set the caption text (just filename for now)
def caption [img_f] {
    echo $img_f
}

# Build the argument for the '-draw' command of the 'convert' utility
def draw_str [img_f] {
    build-string 'text ' $pos_x ',' $pos_y ' "' (caption $img_f) '" '
}

# Select random image
let img_name = (list_images $img_dir | select_random | get name)

# Resize the image to the monitor height, draw the caption and save it
let res_str = (build-string 'x' $resolution_y)
convert -resize $res_str -pointsize 15 -fill 'rgb(255,200,150)' -draw (draw_str $img_name) $img_name $tmp_image

# Set the created image as a background
feh --no-fehbg --bg-max $tmp_image
