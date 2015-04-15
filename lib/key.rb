class Key
  attr_reader :key

  def initialize(key = 0)
    @key = key
  end

  def rotations
    key.chars.each_cons(2).map(&:join).map(&:to_i)
  end

  def self.generate
    Random.new.rand(10_000..99_999).to_s
  end
end
