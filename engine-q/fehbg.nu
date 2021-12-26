#!/usr/bin/env engine-q
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
# * Print the path of the image on top of the selected image
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
# * new Nushell engine (https://github.com/nushell/engine-q)
# * feh
# * imagemagick

# Path definitions
let img-dir = $nu.env.WALLPAPER_DIR
let tmp-image = ([ $nu.env.TMP_DIR "wallpaper.jpg" ] | path join)

# Monitor resolution
let resolution-y = 1440
let res-str = ($"x($resolution-y)")

# Position of the caption
let pos-x = 5
let pos-y = (0.995 * $resolution-y | into int)

# Select random item from input
def select-random [] {
    shuffle | first
}

# List all images in a directory and all its subdirectories
def list-images [dir: path] {
    ls $"($dir)/**/*"
    | where type == File
    | str downcase name
    | where name =~ jpg || name =~ jpeg || name =~ tif || name =~ tiff || name =~ png

}

# Set the caption text (just filename for now)
def caption [img-f: string] {
    echo $img-f
}

# Build the argument for the '-draw' command of the 'convert' utility
def draw-str [img-f: string] {
    $"text ($pos-x), ($pos-y) (char dq)(caption $img-f)(char dq) "
}

# Select random image
let img-name = (list-images $img-dir | select-random | get name) # TODO: change the env var to $img-dir

# Resize the image to the monitor height, draw the caption and save it
convert -resize $res-str -pointsize 15 -fill 'rgb(255,200,150)' -draw (draw-str $img-name) $img-name $tmp-image

# Set the created image as a background
feh --no-fehbg --bg-max $tmp-image
