#!/usr/bin/env nu
let baseurl = 'https://www.schiit.co.uk/'
let pages = [headphone-amps dacs schiit-gaming-products power-amplifiers preamps upgrades accessories-cables schiit%20graded%20stock]
$pages|each {
  fetch (build-string $baseurl $it)|selector 'div.caption' -a|each {
    echo ($it|selector 'p.stock') (echo $it|selector 'h5'|str trim)|
    rotate name availability|
    reject Column2
  }
}
