require_relative 'enigma'


handle = File.open("#{ARGV[0]}", "r")
message = handle.read.chomp

if ARGV[2].size == 5
  key = ARGV[2]
else
  abort("****ERROR****\nKey must be a five digit number.")
end

if ARGV[3].size == 6
  date = ARGV[3]
else
  abort("****ERROR****\nDate must be in the format DDMMYY, e.g. 070315")
end

result = Enigma.new(message, key, date).decrypt

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

puts "Created 'decrypted.txt' with the key #{key} and date #{date}"
