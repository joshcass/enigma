require_relative 'key'
require_relative 'offset'
require_relative 'enigma'


handle = File.open("#{ARGV[0]}", "r")
message = handle.read.chomp
key = Key.generate
date = Offset.today

result = Enigma.new(message, key, date).encrypt

writer = File.open("#{ARGV[1]}", "w")
writer.write(result + "\n")
writer.close

puts "Created 'encrypted.txt' with the key #{key} and date #{date}"

