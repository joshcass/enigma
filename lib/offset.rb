# Creates the array of rotation values for the offset portion and generates a properly formatted current date.
class Offset
  attr_reader :date

  def initialize(date = 0)
    @date = date.to_s.rjust(6, "0")
  end

  def offsets
    squared.chars.map(&:to_i).last(4)
  end

  def self.today
    Time.now.strftime("%d%m%y").to_s
  end

  private
  def squared
    (date.to_i ** 2).to_s.rjust(6, "0")
  end
end
