require_relative "heap"

class Array
  # heap_idx is the pointer, divider line
  def heap_sort!
    # if array is less than 2, array will be returned
    2.upto(self.count).each do |heap_idx|
      BinaryMinHeap.heapify_up(self, heap_idx - 1, heap_idx)
    end

    self.count.downto(2).each do |heap_idx|
      self[heap_idx - 1], self[0] = self[0], self[heap_idx]
      BinaryMinHeap.heapify_down(self, 0, heap_idx - 1)
    end

    self.reverse!
  end
end
