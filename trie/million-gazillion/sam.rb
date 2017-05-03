require 'pry'
require 'byebug'

# When you invoke super with arguments, Ruby sends a message to the
# parent of the current object, asking it to invoke a method of the same name
# as the method invoking super.
# super sends exactly those arguments.

# root node
# add/insert : which checks and adds word if not present
# include?
# find

class Trie
  def initialize
    @root_node = {}
  end

  def add(word_string)
    current_node = @root_node
    is_new_word = false

    word_string.each_char do |char|
      debugger
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
    debugger
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

# unless statement review
    # unless conditional [then]
    #   code
    # [else
    #   code]
    # end
# executes code if conditional is false
# if the conditional is true, code specified in the else clause is executed
