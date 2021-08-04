#!/usr/bin/env nu
let baseurl = 'https://www.schiit.co.uk/'
let pages = [headphone-amps dacs schiit-gaming-products power-amplifiers preamps upgrades accessories-cables schiit%20graded%20stock]
$pages|each {
  let product = $it
  fetch (build-string $baseurl $product)|selector 'div.caption' -a|each {
    echo [[($it|selector 'h5'|str trim)]; [(echo $it|selector 'p.stock')]]|pivot $product availability
  }
}  
