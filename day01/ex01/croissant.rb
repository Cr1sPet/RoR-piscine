#!/usr/bin/env ruby

def read_file file_name

  begin
  file = File.new(file_name, 'r:UTF-8')
  rescue SystemCallError => e
    puts e.message
    exit
  end

  content = file.read

  file.close

  content
end

def complete file_name

  begin
    content = read_file file_name
    rescue IOError => e
      puts e.message
      file_name.close
      exit
  end
  content.tr ',', ''

end

def process
  puts complete './numbers.txt'
end

process
