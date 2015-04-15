require './lib/denigma'
require './lib/enigma'

# setup up values from user input
handle = File.open("#{ARGV[0]}", "r")
message = handle.read.chomp
if ARGV[2].size == 6
  date = ARGV[2]
else
  abort("****ERROR****\nDate must be in the format DDMMYY, e.g. 070315")
end
# crack the key
cracked_key = Denigma.new(message, date).crack
#decrypt the message with cracked key
result = Enigma.new(message, cracked_key, date).decrypt
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
puts "Created #{ARGV[1]} with the key #{cracked_key} and date #{date}"

