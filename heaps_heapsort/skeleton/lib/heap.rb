class BinaryMinHeap
  def initialize(&prc)
    self.store = []
    self.prc = prc || Proc.new {|el1, el2| el1 <=> el2 }
  end

  def count
    store.length
  end

# pop - which will heapify down
  def extract
    raise "store is empty" if count == 0

    pop_value = store[0]

    if count > 1
      store[0] = store.pop
      self.class.heapify_down(store, 0, &prc)
    else
      store.pop
    end

    pop_value
  end

# let us know the min because min Heap - look at root node
  def peek
    raise "store is empty" if count == 0
    self.store[0]
  end

# insert - which will heapify up
  def push(val)
    store << val
    self.class.heapify_up(store, self.count - 1, &prc)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_idx)
    left = 2 * parent_idx + 1
    right = 2 * parent_idx + 2
    [left, right].select { |child_idx| child_idx < len }
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    left_child_idx, right_child_idx = child_indices(len, parent_idx)
    parent_value = array[parent_idx]

    children_values = []
    children_values << array[left_child_idx] if left_child_idx
    children_values << array[right_child_idx] if right_child_idx

    if children_values.all? { |child_value| prc.call(parent_value, child_value) <= 0 }
      return array
    end

    swap_idx = nil
    if children_values.length == 1
      swap_idx = left_child_idx
    else
      swap_idx = prc.call(children_values[0], children_values[1]) == -1 ? left_child_idx : right_child_idx
    end

    array[parent_idx], array[swap_idx] = array[swap_idx], array[parent_idx]

    # recursive call
    heapify_down(array, swap_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return array if child_idx == 0

    parent_idx = parent_index(child_idx)
    parent_value = array[parent_idx]
    child_value = array[child_idx]

    if prc.call(child_value, parent_value) >= 0
      return array
    else
      array[child_idx], array[parent_idx] = parent_value, child_value
      heapify_up(array, parent_idx, len, &prc)
    end
  end
end
