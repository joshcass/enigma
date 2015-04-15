require_relative 'enigma'

class Denigma
  attr_reader :date, :key, :message, :cracked

  def initialize(message, date)
    @date = date
    @key = 10000
    @message = message
    @cracked = false
  end

  def crack
    until cracked
      decrypted_message = Enigma.new(message, key.to_s, date).decrypt
      if decrypted_message[-7..-1] == "..end.."
        @cracked = true
      else
        @key += 1
      end
    end
    key.to_s
  end
end
