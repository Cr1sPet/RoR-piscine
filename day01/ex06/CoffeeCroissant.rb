#!/usr/bin/env ruby

def sort_hash hash
  hash.sort {|a, b|
    cmp = a[1] <=> b[1]
    cmp = a[0] <=> b[0] if cmp == 0
    cmp
  }
end

def print_hash_keys hash
  hash.each {|key, val|
    puts key
  }
end

def process

  data = [
    ['Frank', 33],
    ['Stacy', 15],
    ['Juan' , 24],
    ['Dom' , 32],
    ['Steve', 24],
    ['Jill' , 24]
    ]

  print_hash_keys sort_hash data
end

process
