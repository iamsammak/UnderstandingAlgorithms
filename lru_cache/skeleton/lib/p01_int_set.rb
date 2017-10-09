class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    return false if @store[num] #if num is not in store then return false
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    return nil unless include?(num) #if num is included then remove
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    0 <= num && num < @store.length
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end

# Note to self. A set is just an Array of arrays in which each bucket only housed one num
# Example: [[5], [3], [4], [], [], [], [], [], []] etc...

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if include?(num)
    i = num % num_buckets
    @store[i] << num
    # self[num] << num
    num
  end

  def remove(num)
    i = num % num_buckets
    @store[i].delete(num)
    # self[num].delete(num)
  end

  def include?(num)
    i = num % num_buckets
    @store[i].include?(num)
    # self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    # @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
    @count += 1
    resize! if num_buckets < @count
    num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    i = num % num_buckets
    @store[i]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }
    old_store.flatten.each do |num|
      insert(num)
    end
  end
end


# SKELETON BELOW
# class MaxIntSet
#   def initialize(max)
#   end
#
#   def insert(num)
#   end
#
#   def remove(num)
#   end
#
#   def include?(num)
#   end
#
#   private
#
#   def is_valid?(num)
#   end
#
#   def validate!(num)
#   end
# end
#
#
# class IntSet
#   def initialize(num_buckets = 20)
#     @store = Array.new(num_buckets) { Array.new }
#   end
#
#   def insert(num)
#   end
#
#   def remove(num)
#   end
#
#   def include?(num)
#   end
#
#   private
#
#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`
#   end
#
#   def num_buckets
#     @store.length
#   end
# end
#
# class ResizingIntSet
#   attr_reader :count
#
#   def initialize(num_buckets = 20)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end
#
#   def insert(num)
#   end
#
#   def remove(num)
#   end
#
#   def include?(num)
#   end
#
#   private
#
#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`
#   end
#
#   def num_buckets
#     @store.length
#   end
#
#   def resize!
#   end
# end
