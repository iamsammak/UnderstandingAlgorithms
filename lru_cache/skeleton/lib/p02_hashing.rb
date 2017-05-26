class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |el, i|
      if el.is_a?(Array)
        return el.hash
      else
        sum += el ^ i
      end
    end
    sum.hash
  end
end

class String
  def hash
    # convert string into letters then into numbers (ord) then hash'em
    chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # building on top of each other
    # convert hash to array then run them through a hash
    # which will array.hash, string.hash or fixnum.hash (to.a.sort_by(&:hash).hash)
    xored = []
    self.each do |key, value|
      xored << (key.hash ^ value.hash)
    end
    xored.sort.hash
  end
end
