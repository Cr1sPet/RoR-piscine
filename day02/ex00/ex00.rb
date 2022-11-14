#!/usr/bin/env ruby

class Html

  def Html.obj_count
    count = 0
    ObjectSpace.each_object(self){|obj| count += 1}
  end

  def initialize(page_name)
    @page_name = page_name
    head
  end

  attr_reader :page_name

  def head
    file = File.new("#{page_name}.html", 'w');
    file.puts(
      "<!DOCTYPE html>
      <html lang='en'>
        <head>
          <title>#{page_name}</title>
          <meta charset='UTF-8'>
        </head>
        <body>"
    )
    file.close
  end

  def dump info
    file = File.open("#{page_name}.html", 'a')
    file.puts(
      "<p>#{info}</p>"
    )
    file.close
  end

  def finish
    file = File.open("#{page_name}.html", 'a')
    file.puts(
      "</body>
      </html>"
    )
    file.close
  end

end

if $PROGRAM_NAME == __FILE__
  a = Html.new "generated"
  10.times{|el| a.dump "test_p_#{el}"}
  a.finish
end

# require_relative "ex00.rb"
