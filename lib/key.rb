class Key
  attr_reader :key

  def initialize(key = generate)
    @key = key
  end

  def rotations
    key.chars.each_cons(2).map(&:join).map(&:to_i)
  end

  private

  def generate
    Random.new.rand(10_000..99_999)
  end
end
