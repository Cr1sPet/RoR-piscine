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
    if File.exist? "#{page_name}.html"
      raise "A file named #{page_name}.html already exist!"
    end
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

    input = File.read "#{page_name}.html"
    if !input.include? '<body>'
      raise "There is no body tag in #{page_name}.html"
    end
    if input.include? '</body>'
      raise "Body has already been closed in  #{page_name}.html"
    end

    file = File.open("#{page_name}.html", 'a')

    file.puts(
      "<p>#{info}</p>"
    )
    file.close
  end

  def finish

    if (File.read "#{page_name}.html").include? '</body>'
      raise  "#{page_name}.html has already been closed."
    end

    file = File.open("#{page_name}.html", 'a')

    file.puts(
      "</body>
      </html>"
    )
    file.close
  end

end


if $PROGRAM_NAME == __FILE__
  a = nil
  begin
    a = Html.new "generated"
    a = Html.new "generated"

    rescue RuntimeError => e
      puts e.message
  end

  a.dump 'test'

  begin
    a.finish
    a.finish
    rescue RuntimeError => e
      puts e.message
  end

  begin

    a.dump 'test'

    rescue RuntimeError => e
      puts e.message
  end
end

# require_relative "ex01.rb"
