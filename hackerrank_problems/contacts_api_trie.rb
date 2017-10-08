class Trie
  def initialize
    @root_node = {}
  end

  def add(word_string)
    current_node = @root_node
    is_new_word = false

    word_string.each_char do |char|
      # debugger
      if !current_node.key?(char)
        is_new_word = true
        current_node[char] = {}
      end
      current_node = current_node[char]
    end

    if !current_node.key?(:end)
      is_new_word = true
      current_node[:end] = {}
    end

    is_new_word
  end

  def include?(word_string)
    # debugger
    # (a && b ) : if both the operands are non zero, then the codition becomes true
    if find(word_string) && find(word_string).key?(:end)
      true
    else
      false
    end
  end

  def find(word_string)
    current_node = @root_node
    word_string.each_char do |char|
      current_node = current_node[char]
      return false if current_node.nil?
    end
    current_node
    # true
  end

end

def count_words(node, count = 0)
  if node == {}
    count += 1
    return count
  end

  keys = node.keys
  keys.each do |char|
    child_node = node[char]
    count = count_words(child_node, count)
  end
  return count
end

# #!/bin/ruby
#
# sam = Trie.new
#
# n = gets.strip.to_i
# for a0 in (0..n-1)
#     op,contact = gets.strip.split(' ')
#
#     temp_node = sam.send(op, contact)
#     if (op === "find")
#         puts 0 if !temp_node
#         if (temp_node.is_a?(Hash))
#             count = count_words(temp_node)
#             puts count
#         end
#     end
# end
