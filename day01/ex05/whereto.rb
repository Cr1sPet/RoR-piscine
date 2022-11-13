#!/usr/bin/env ruby
def get_states
  {
   "Oregon" => "OR",
   "Alabama" => "AL",
   "New Jersey" => "NJ",
   "Colorado" => "CO"
   }
end

def get_capitals_cities
 {
   "OR" => "Salem",
   "AL" => "Montgomery",
   "NJ" => "Trenton",
   "CO" => "Denver"
 }
end

def get_result_string elem
  if get_capitals_cities.has_value? elem
    akr = get_capitals_cities.key(elem)
    return "#{elem} is the capital of #{get_states.key(akr)} (akr: #{akr})"
  end
  if get_states.has_key? elem
    akr = get_states[elem]
    return "#{get_capitals_cities[akr]} is the capital of #{elem} (akr: #{akr})"
  end
  "#{elem} is neither a capital city nor a state"
end

def parse argv
  exit if argv.length != 1
  arr = argv[0].split ','
  exit if arr.include? ''
  arr.map{|el| el.gsub(/\s+/, '').capitalize}.select do |el|
    el != ''
  end
end

def process
  arr = parse ARGV
  puts arr.map{|el| get_result_string el}
end

process
