### Solution
We can build an array score_counts where the indices represent scores and the values represent how many times the score appears. Once we have that, we can generate a sorted array of the scores.

```ruby
def sort_scores(unsorted_scores, highest_possible_score)

  # array of 0s at indices 0..highest_possible_score
  score_counts = [0] * (highest_possible_score+1)

  # populate score_counts
  unsorted_scores.each do |score|
      score_counts[score] += 1
  end

  # populate the final sorted array
  sorted_scores = []

  # for each item in score_counts
  score_counts.each_with_index do |count, score|

      # for the number of times the item occurs
      (0...count).each do |time|

          # add it to the sorted array
          sorted_scores.push(score)
      end
  end

  return sorted_scores
end
```

#### Complexity
O(n) time and space.

Even though the solution has a nested loop towards the end, notice what those loops iterate over. The outer loop runs once for each unique number in the array. The inner loop runs once for each time that number occurred.

So in essence we're just looping through the n numbers from our input array, except we're splitting it into two steps: (1) each unique number, and (2) each time that number appeared.
Here's another way to think about it: in each iteration of our two nested loops, we append one item to sorted_scores. How many numbers end up in sorted_scores in the end? Exactly how many were in our input array, n,

#### Takeaways
Counting is a common pattern in time-saving algorithms. It can often get you O(n) runtime, but at the expense of adding O(n) space. In an interview, being able to talk through these trade-offs and considerations will earn you brownie points with the interviewer.


#### Bonus

Attempt at using an [in-place algorithm][in-place]

[in-place]: ./in-place.md
