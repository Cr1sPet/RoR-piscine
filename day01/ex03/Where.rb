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


def get_capital_by_state state

  state_key = get_states[state]

  get_capitals_cities[state_key] || 'Unknown state'

end

def parse argv
  if argv.length != 1
    exit
  end
  argv[0]
end

puts get_capital_by_state parse ARGV
