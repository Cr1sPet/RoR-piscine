#!/usr/bin/env ruby

def get_data
  [['Caleb' , 24],
  ['Calixte' , 84],
  ['Calliste', 65],
  ['Calvin' , 12],
  ['Cameron' , 54],
  ['Camil' , 32],
  ['Camille' , 5],
  ['Can' , 52],
  ['Caner' , 56],
  ['Cantin' , 4],
  ['Carl' , 1],
  ['Carlito' , 23],
  ['Carlo' , 19],
  ['Carlos' , 26],
  ['Carter' , 54],
  ['Casey' , 2]]
end

def get_hash
  data = get_data

  data.to_h {|obj| [obj[1], obj[0]]}
end

def process
  get_hash.each { |key, value| puts "#{key} : #{value}" }
end

process
