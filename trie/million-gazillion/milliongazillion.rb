require 'pry'
# to load in terminal via pryc

class Trie

  def initialize
    @root_node = {}
  end

  def check_present_and_add(word)
    current_node = @root_node
    is_new_word = false

    # Work downwards through the trie, adding nodes
    # as needed, and keeping track of whether we add
    # any nodes.
    word.each_char do |char|
      if !current_node.key? char
        is_new_word = true
        current_node[char] = {}
      end
      current_node = current_node[char]
    end

    # Explicitly mark the end of a word.
    # Otherwise, we might say a word is
    # present if it is a prefix of a different,
    # longer word that was added earlier.
    if !current_node.key? "End Of Word"
      is_new_word = true
      current_node["End Of Word"] = {}
    end

    return is_new_word
  end
end

sam_trie = Trie.new
sam_trie.check_present_and_add("word")
sam_trie.check_present_and_add("donut")
sam_trie.check_present_and_add("dogs")
sam_trie.check_present_and_add("doldrums")
sam_trie.check_present_and_add("doldrum")
sam_trie.check_present_and_add("dog")
sam_trie.check_present_and_add("doggie")

puts sam_trie.inspect

if $PROGRAM_NAME == __FILE__
  puts "I'm a command line script now!"
  # not in pry run "ruby milliongazillion.rb"
else
  puts "Someone else is running me (I feel so violated...)"
end
