
def read_file file_name
  file = File.new(file_name, 'r:UTF-8')

  content = file.read

  file.close

  content
end

def complete file_name

  content = read_file file_name
  content.tr ',', ''
  # content

end

puts complete './numbers.txt'
