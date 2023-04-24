#!/usr/bin/env nu
let baseurl = 'https://www.schiit.co.uk/'
let pages = ['headphone-amps' 'dacs' 'schiit-gaming-products' 'power-amplifiers' 'preamps' 'upgrades' 'accessories-cables' 'schiit%20graded%20stock']

# Simple script to check stock of https://schiit.co.uk store
def main [] {
  $pages | par-each { |page|
    http get ($baseurl + $page)
    |query web -q '.price, .stock, .product-item h5'
    |str trim
    |group 3
    |each {
      |x| {
        name: $x.0,
        avail: $x.1,
        price: $x.2
      }
    }
  }
  |sort-by avail
}
