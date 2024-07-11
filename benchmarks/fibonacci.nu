#!/usr/bin/env nu
# This benchmark covers the evaluation performance of some very simple, iterative Nushell code that
# doesn't require a bunch of calls into nested closures and doesn't rely on commands to do any
# heavy lifting.
#
# Originally added by @devyn to show what absolute best case performance for IR evaluation can look
# like. Not super representative of normal Nushell code.

use std bench

def fib [n: int] {
  mut a = 0
  mut b = 1
  for _ in 2..=$n {
    let c = $a + $b
    $a = $b
    $b = $c
  }
  $b
}

def main [] {
  print (bench -n 1000 { 0..50 | each { |n| fib $n } } | reject times)
}
