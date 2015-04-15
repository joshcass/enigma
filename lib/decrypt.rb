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

writer = File.open("#{ARGV[1]}", "w")
writer.write(result + "\n")
writer.close

puts "Created 'decrypted.txt' with the key #{key} and date #{date}"
