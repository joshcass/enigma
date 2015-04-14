require_relative 'total_rotations'
require_relative 'cipher'

class Encryptor
  attr_reader :rotations, :message, :master_cipher

  def initialize(message, key, date)
    @rotations = TotalRotations.new(key, date).sum
    @master_cipher = []
    @message = message.chars
  end

  def encrypt
    generate_cipher
    n = 0
    message.map.with_index do |l, i|
      master_cipher[n][message[i]]
      n < 3 ? n : n += 1
    end.join
    # message.map.with_index {|l, i| master_cipher[i][message[i]]}.join
  end

  private

  def generate_cipher
    @master_cipher = rotations.map {|n| Cipher.new(n).cipher}
  end
end