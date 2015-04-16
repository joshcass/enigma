require_relative 'enigma'

# Performs brute force cracking to find the key when provided an encrypted message and date.
class Denigma
  attr_reader :date, :key, :message, :cracked

  def initialize(message, date)
    @date = date
    @key = 0
    @message = message
    @cracked = false
  end

  def crack
    until cracked
      decrypted_message = Enigma.new(message, key, date).decrypt
      if decrypted_message[-7..-1] == "..end.."
        @cracked = true
      elsif
        key == 99999
        abort("***OPERATION ABORTED***\nIncorrect encrypted message or date.")
      else
        @key += 1
      end
    end
    key.to_s
  end
end
