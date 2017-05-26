class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.empty?

    rand_pivot = rand.(array.length)
    array[0], array[rand_pivot] = array[rand_pivot], array[0]

    pivot = array.first

    left = array.select { |el| pivot > el }
    middle = pivot
    right = array.select { |el| pivot <= el }

    sort1(left) + middle + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return array if length < 2

    pivot_idx = partition(array, start, length, &prc)

    left_length = pivot_idx - start
    right_length = length - (left_length + 1) #account for pivot_idx

    sort2!(array, start, left_length, &prc)
    sort2!(array, pivot_idx + 1, right_length, &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    pivot_idx = start
    pivot_val = array[start]
    ((start + 1)...(start + length)).each do |idx|
      value = array[idx]

      if prc.call(pivot_val, value) < 1
        next
      else
        array[idx] = array[pivot_idx + 1]
        array[pivot_idx + 1] = pivot_val
        array[pivot_idx] = value
        pivot_idx += 1
      end
    end

    pivot_idx
  end
end
