def sort_scores(unsorted_scores, highest_possible_score)
  # create an empty array 0s
  # where the index will be the score and
  # the value will the amount of times that particular score has appeared
  score_counts = [0] * (highest_possible_score + 1)

  # next populate the score counts
  unsorted_scores.each do |score|
    score_counts[score] += 1
  end

  # populate the final sorted array
  sorted_scores = []

  # remember the index will be the score
  score_counts.each_with_index do |count, score|

    # insert into final array amount of times the "score" occurs
    (0...count).each do |time|
      sorted_scores.push(score)
    end
  end

  # return final array of the scores in sorted fashion
  sorted_scores
end
