class TotalRotations

  def sum(key, date)
    r = Key.new(key).rotations
    o = Offset.new(date).offset_key

    r.zip(o).map do |n|
      n.reduce(:+)
    end
  end

end
