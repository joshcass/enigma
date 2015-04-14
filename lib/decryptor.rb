require_relative 'total_rotations'
require_relative 'cipher'

class Decryptor
  attr_reader :rotations, :message, :master_cipher

  def initialize(message, key, date)
    @rotations = TotalRotations.new(key, date).sum
    @master_cipher = []
    @message = message.chars
  end

  def decrypt
    generate_cipher
    message.map.with_index do |l, i|
      n = 0
      master_cipher[n][message[i]]
      n == 3 ? n = 0 : n += 1
    end.join
  end

  private

  def generate_cipher
    @master_cipher = rotations.map {|n| Cipher.new(-n).cipher}
  end
end
