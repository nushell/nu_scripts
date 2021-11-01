#!/usr/bin/env nu
let baseurl = 'https://www.schiit.co.uk/'
let pages = [headphone-amps dacs schiit-gaming-products power-amplifiers preamps upgrades accessories-cables schiit%20graded%20stock]
$pages|each {
  fetch (build-string $baseurl $it)|selector -q 'div.caption' -m|each {
    $it|selector -q 'p.stock, h5'|str trim|
    rotate counter-clockwise t name availability|
    reject t
  }
}|sort-by availability
