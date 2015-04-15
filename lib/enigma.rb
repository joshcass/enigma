require_relative 'total_rotations'
require_relative 'cipher'

class Enigma
  attr_reader :rotations, :message

  def initialize(message, key, date)
    @rotations = TotalRotations.new(key, date).sum
    @message = message.chars
  end

  def encrypt
    translator(rotations.map {|n| Cipher.new(n).cipher})
  end

  def decrypt
    translator(rotations.map {|n| Cipher.new(-n).cipher})
  end


  private

  def translator(cipher)
    n = 0
    message.map do |l|
      n == 4 ? n = 1 : n += 1
      cipher[n - 1][l]
    end.join



    # n = 0
    # message.map.with_index do |l, i|
    #   n == 4 ? n = 1 : n += 1
    #   cipher[n - 1][message[i]]
    # end.join
  end
end
