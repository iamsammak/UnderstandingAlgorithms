# In place Algorithm

Many sorting algorithms rearrange arrays into sorted order in-place, including: [bubble sort][bubble-sort], [comb sort][comb-sort], [selection sort][selection-sort], [insertion sort][insertion-sort], [heapsort][heapsort], and [Shell sort][shell-sort].

But I'm going to try using a [Quicksort][quicksort]

## Quicksort
```ruby
  class Quicksort
    def self.sort!(array, start = 0, length = array.length, &prc)
      prc ||= Proc.new { |el1, el2| el1 <=> el2 }

      return array if length < 2

      pivot_idx = partition(array, start, length, &prc)

      left_length = pivot_idx - start
      right_length = length - (left_length + 1)
      sort!(array, start, left_length, &prc)
      sort!(array, pivot_idx + 1, right_length, &prc)

      array
    end

    def self.partition(array, start, length, &prc)
      prc ||= Proc.new { |el1, el2| el1 <=> el2 }

      pivot_idx, pivot = start, array[start]
      ((start + 1)...(start + length)).each do |idx|
        val = array[idx]
        if prc.call(pivot, val) < 1
        else
          array[idx] = array[pivot_idx + 1]
          array[pivot_idx + 1] = pivot
          array[pivot_idx] = val
          pivot_idx += 1
        end
      end

      pivot_idx
    end
  end
```

[BigO Cheatsheet](http://bigocheatsheet.com/)

<!-- Wiki links -->
[bubble-sort](https://en.wikipedia.org/wiki/Bubble_sort)
[comb-sort](https://en.wikipedia.org/wiki/Comb_sort)
[selection-sort](https://en.wikipedia.org/wiki/Selection_sort)
[insertion-sort](https://en.wikipedia.org/wiki/Insertion_sort)
[heapsort](https://en.wikipedia.org/wiki/Heapsort)
[shell-sort](https://en.wikipedia.org/wiki/Shellsort)
[quicksort](https://en.wikipedia.org/wiki/Quicksort)
