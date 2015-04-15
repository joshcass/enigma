require_relative 'key'
require_relative 'offset'
require_relative 'enigma'


handle = File.open("#{ARGV[0]}", "r")
message = handle.read.chomp
key = Key.generate
date = Offset.today

result = Enigma.new(message, key, date).encrypt

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

puts "Created 'encrypted.txt' with the key #{key} and date #{date}"

