require_relative 'key'
require_relative 'offset'
require_relative 'enigma'

# setup values from user input
handle = File.open("#{ARGV[0]}", "r")
message = handle.read.chomp.downcase
key = Key.generate
date = Offset.today

# run the program
result = Enigma.new(message, key, date).encrypt

# write the result to a new file, first checking if it exists
if File::exists?("#{ARGV[1]}")
  puts "***Warning***\nThis file already exists, would you like to overwrite it?\n'y' to overwrite, any other key to cancel"
  answer = $stdin.gets.chomp
  if answer == "y"
    @writer = File.open("#{ARGV[1]}", "w")
  else
    abort("Operation Canceled")
  end
else
  @writer = File.open("#{ARGV[1]}", "w")
end
@writer.write(result + "\n")
@writer.close

# print the actions to the console
puts "Created #{ARGV[1]}with the key #{key} and date #{date}"
