class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if !@root
      @root = BSTNode.new(value)
      return
    end

    BinarySearchTree.insert!(@root, value)
  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    @root = BinarySearchTree.delete!(@root, value)
  end

  def self.insert!(node, value)
    #if node isn't given
    return BSTNode.new(value) unless node

    if value <= node.value
      node.left = BinarySearchTree.insert!(node.left, value)
    else
      node.right = BinarySearchTree.insert!(node.right, value)
    end

    node
  end

  def self.find!(node, value)
    return nil unless node
    #return if found aka equal value
    return node if node.value == value
    # recursive call to the left if value is smaller
    if value < node.value
      return BinarySearchTree.find!(node.left, value)
    else
    # else its bigger, value > node.value
      return BinarySearchTree.find!(node.right, value)
    end
  end

  def self.preorder!(node)
    return [] unless node

    array = [node.value]
    array += BinarySearchTree.preorder!(node.left) if node.left
    array += BinarySearchTree.preorder!(node.right) if node.right

    array
  end

  def self.inorder!(node)
    return [] unless node

    array = []
    #left children values
    array += BinarySearchTree.inorder!(node.left) if node.left
    #orginal parent node value
    array << node.value
    # right children values
    array += BinarySearchTree.inorder!(node.right) if node.right

    array
  end

  def self.postorder!(node)
    return [] unless node

    array = []
    array += BinarySearchTree.postorder!(node.left) if node.left
    array += BinarySearchTree.postorder!(node.right) if node.right
    array << node.value

    array
  end

  def self.height!(node)
    return -1 unless node
    left_depth = BinarySearchTree.height!(node.left)
    right_depth = BinarySearchTree.height!(node.right)
    # have to add 1 for the depth of root node
    return 1 + [left_depth, right_depth].max
  end

# lesser or equal nodes to the left of their parents
# larger nodes to the right
  def self.max(node)
    return nil unless node
    return node unless node.right

    BinarySearchTree.max(node.right)
  end

  def self.min(node)
    return nil unless node
    return node unless node.left
    BinarySearchTree.min(node.left)
  end

  def self.delete_min!(node)
    return nil unless node
    return node.right unless node.left
    node.left = BinarySearchTree.delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil unless node

    case value <=> node.value
    when -1 # value < node.value
      node.left = BinarySearchTree.delete!(node.left, value)
    when 1 # value > node.value
      node.right = BinarySearchTree.delete!(node.right, value)
    when 0
      return node.left unless node.right
      return node.right unless node.left

      temp = node
      node = temp.right.min
      node.right = BinarySearchTree.delete_min!(temp.right)
      node.left = temp.left
    end

    node
  end
end
