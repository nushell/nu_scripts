#!/usr/bin/env nu
# This is a much less efficient, recursive version of fibonacci that can be used to test our
# command call performance.

use std bench

def fib [n: int] {
  match $n {
    0 => 0,
    1 => 1,
    $n => { (fib ($n - 1)) + (fib ($n - 2)) },
  }
}

def main [] {
  print (bench { 0..20 | each { |n| fib $n } } | reject times)
}
