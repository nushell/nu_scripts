#!/usr/bin/env nu
let baseurl = 'https://www.schiit.co.uk/'
let pages = ['headphone-amps' 'dacs' 'schiit-gaming-products' 'power-amplifiers' 'preamps' 'upgrades' 'accessories-cables' 'schiit%20graded%20stock']

# Simple script to check stock of https://schiit.co.uk store
def main [] {
  $pages|par-each {|page|
  fetch $"($baseurl)($page)"
  |query web -q 'div.caption' -m
  |par-each {|item|
    $item
    |query web -q 'p.stock, h5'
    |rotate --ccw name availability
  }
  |flatten
}
|flatten
|uniq
|sort-by availability
}