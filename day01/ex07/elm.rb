#!/usr/bin/env ruby

def get_column item
  el = item.split ':'
  return "<td>#{el[1].strip}</td>\n"
end

def get_columns items
  string = ""
  items.each do |el|
    string << (get_column el)
  end
  string
end

def get_row str
  strings = str.split '='
  items = strings[1].split ','.strip
  "<tr>
  <td>#{strings[0].strip}</td>
  #{get_columns items}</tr>\n"
end

def print_header file
  header = "<!DOCTYPE html>
<html lang='en'>
  <head>
    <title>periodic table</title>
    <meta charset='UTF-8'>
    <style>
    table,
    th,
    td {
      border: 1px solid black;
      border-collapse: collapse;
      text-align: center;
      vertical-align: middle;
    }
  </style>
  </head>
<body>
  <table>
    <tr>
      <th>element</th>
      <th>position</th>
      <th>number</th>
      <th>small</th>
      <th>molar</th>
      <th>electron</th>
    </tr>"

    file.write(
      header
    )
end

def print_footer file
  footer = '</table>
    </body>
  </html>'

  file.write(
    footer
  )

end

def print_content info_file, file
  File.foreach(info_file) {|line|
    file.write(get_row line)
  }
end

def process
  file = File.open("periodic_table.html",  'w')
  info_file = File.open('./periodic_table.txt', 'r')

  print_header file
  print_content info_file, file
  print_footer file

  file.close
  info_file.close
end

process
