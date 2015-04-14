class Key
  attr_reader :key

  def initialize(key = 0)
    @key = key.to_s
  end

  def generate
    Random.new.rand(10_000..99_999)
  end

  def rotations
    r = []
    4.times do |n|
      r << (key[n] + key[n + 1]).to_i
      n += 1
    end
    r
  end

end
