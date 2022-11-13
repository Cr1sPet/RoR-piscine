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


def get_state_by_capital capital

 state_key = get_capitals_cities.key(capital)

 get_states.key(state_key) || 'Unknown capital city'

end

def parse argv
 if argv.length != 1
   exit
 end
 argv[0]
end

def process
  puts get_state_by_capital parse ARGV
end

process
