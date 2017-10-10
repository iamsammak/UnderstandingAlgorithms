class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next = nil
    self.prev = nil
    self
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    # break case is: if list is empty return nil
    # user tenary operator
    empty? ? nil : @head.next
  end

  def last
    empty? ? nil : @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    # call each function below, to iterate up list, until we hit key
    each do |node|
      return node.val if node.key == key
    end
    nil # return nil if we can't find a node with provided key
  end

  def include?(key)
    # iterate thru List until we find key
    # use Enumerable class' any? method
    # which will return true if at least one of the collection members is not false or nil
    any? { |node| node.key == key }
  end

  def append(key, val)
    # append means to add a node to the tail of the list
    new_node = Node.new(key, val)

    @tail.prev.next = new_node
    new_node.prev = @tail.prev
    new_node.next = @tail
    @tail.prev = new_node

    new_node # return inserted node
  end

  def update(key, val)
    # iterate thru list, till we find the key
    # then update
    each do |node|
      if node.key == key
        node.val = val
        return node
      end
    end
    # should I return nil if update never found the key provided
  end

  def remove(key)
    # iterate thru list, then remove
    each do |node|
      if node.key == key
        node.remove
        return node.val
      end
    end

    nil
  end

  def each
    # go node by node
    current_node = @head.next
    until current_node == @tail
      yield current_node # returns current_node back to block before continuing with code below/after yield
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end

# SKELETON
# class Node
#   attr_accessor :key, :val, :next, :prev
#
#   def initialize(key = nil, val = nil)
#     @key = key
#     @val = val
#     @next = nil
#     @prev = nil
#   end
#
#   def to_s
#     "#{@key}: #{@val}"
#   end
#
#   def remove
#     # optional but useful, connects previous link to next link
#     # and removes self from list.
#   end
# end
#
# class LinkedList
#   def initialize
#   end
#
#   def [](i)
#     each_with_index { |link, j| return link if i == j }
#     nil
#   end
#
#   def first
#   end
#
#   def last
#   end
#
#   def empty?
#   end
#
#   def get(key)
#   end
#
#   def include?(key)
#   end
#
#   def append(key, val)
#   end
#
#   def update(key, val)
#   end
#
#   def remove(key)
#   end
#
#   def each
#   end
#
#   # uncomment when you have `each` working and `Enumerable` included
#   # def to_s
#   #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
#   # end
# end
