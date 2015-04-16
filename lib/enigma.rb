require_relative 'total_rotations'
require_relative 'cipher'

# Contains the encrypting and decrypting algorithms.
class Enigma
  attr_reader :rotations, :message

  def initialize(message = oops, key, date)
    @rotations = TotalRotations.new(key, date).sum
    @message = message.downcase.chars
    character_check
  end

  def encrypt
    transposer(rotations.map {|num| Cipher.new(num).cipher})
  end

  def decrypt
    transposer(rotations.map {|num| Cipher.new(-num).cipher})
  end

  private
  def transposer(cipher)
    index = 0
    message.map do |letter|
      index == 4 ? index = 1 : index += 1
      cipher[index - 1][letter]
    end.join
  end

  def oops
    abort("****ERROR****\nNo message given.")
  end

  def character_check
    character_set = Cipher.new.characters
    if message.none?{|letter| character_set.include?(letter)}
      abort("****ERROR****\nMessage has invalid characters.")
    else
      message
    end
  end
end
