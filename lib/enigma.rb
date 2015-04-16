require_relative 'total_rotations'
require_relative 'cipher'

# Contains the encrypting and decrypting algorithms.
class Enigma
  attr_reader :rotations, :message

  def initialize(message, key, date)
    @rotations = TotalRotations.new(key, date).sum
    @message = message.chars
  end

  def encrypt
    translator(rotations.map {|num| Cipher.new(num).cipher})
  end

  def decrypt
    translator(rotations.map {|num| Cipher.new(-num).cipher})
  end


  private
  def translator(cipher)
    index = 0
    message.map do |letter|
      index == 4 ? index = 1 : index += 1
      cipher[index - 1][letter]
    end.join
  end
end
