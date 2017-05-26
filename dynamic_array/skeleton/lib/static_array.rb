# This class just dumbs down a regular Array to be staticly sized.
class StaticArray
  def initialize(length)
    self.store = Array.new(length, nil)
    # REVIEW how to make sure When copying an array the pointers aren't putting to the same array
    # deep dup
  end

  # O(1)
  def [](index)
    # get
    return store[index]
  end

  # O(1)
  def []=(index, value)
    # set
    store[index] = value
  end

  protected
  attr_accessor :store
end
