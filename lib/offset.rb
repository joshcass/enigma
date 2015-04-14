class Offset
  attr_reader :date

  def initialize(date = today)
    @date = date
  end

  def offsets
    squared.to_s.chars.map(&:to_i).last(4)
  end

  private

  def squared
    date.to_i ** 2
  end

  def today
    Time.now.strftime("%d%m%y")
  end
end
