#!/usr/bin/env engine-q
#
# ~/.auto_base16.nu
#
# This is a wrapper around fehbg.nu that on top of setting a random wallpaper
# also generates a base16 theme from it.
#
# This script is intended to run on desktop startup, e.g., by calling it in
# ~/.xinitrc.
#
# Requirements:
# 1. go, Python 3, fehbg.nu
# 2. Install schemer2 from https://github.com/makuto/auto-base16-theme and put
#    it into your PATH
# 3. Expected environment variables:
#   * WALLPAPER_IMG - The wallpaper used for generating the base16 scheme
#   * BASE16_TXT - Target file to store the generated base16 scheme
# 4. Both this script and fehbg.nu are expected to be in the home directory as
#    '~/.auto_base16.nu' and '~/.fehbg.nu'.

schemer2 -format img::colors -in $env.WALLPAPER_IMG -out $env.BASE16_TXT
