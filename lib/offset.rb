class Offset
  attr_reader :date

  def initialize(date = "0")
    @date = date
  end

  def today
    Time.now.strftime("%d%m%y")
  end

  def offset_key
    squared.to_s.chars.map(&:to_i).last(4)
  end

  private

  def squared
    date.to_i ** 2
  end

end
