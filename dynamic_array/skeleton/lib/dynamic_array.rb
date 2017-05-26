require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    self.store = StaticArray.new(8)
    self.capacity = 8
    self.length = 0
  end

  # O(1)
  def [](index)
    # raise "index out of bounds" if index > length
    check_index(index)
    store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" unless length > 0
    last_item = self[length - 1]
    self[length - 1] = nil

    self.length -= 1

    last_item
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if length == capacity

    self.length += 1
    self[length - 1] = val

    self
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if length == 0
    first_item = self[0]
    (1...length).each do |i|
      self[i - 1] = self[i]
    end
    self.length -= 1

    first_item
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if length == capacity

    self.length += 1
    # backwards range
    (length - 2).downto(0).each do |i|
      self[i + 1] = self[i]
    end
    self[0] = val

    self
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless index >= 0 && index < length
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_capacity = capacity * 2
    new_store = StaticArray.new(new_capacity)
    # each_with_index { |el, i| new_store[i] = el }
    length.times {|i| new_store[i] = self[i]}

    self.capacity = new_capacity
    self.store = new_store
  end
end
