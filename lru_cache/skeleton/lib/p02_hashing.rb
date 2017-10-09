class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.each_with_index.inject(0) do |memo, (element, i)|
      (element.hash + i.hash) ^ memo
    end
  end
end

# is memo starts off as 0
# then becomes the return of the previous block's result
# example when I add 'puts "memo = #{memo}"' above line 8 inside each... block
# [1,2,3].hash
# memo = 0
# memo = -4902842327663889388
# memo = 1183700854011854848
# => -8185132357692148716 #this is return of the finished hash function

class String
  def hash
    self.chars.map(&:ord).hash
    # above is same as below
    # ret = self.chars.map do |char|
    #   char.ord
    # end
    # ret.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # 0
    # self.to_a.sort_by { |el| el.hash }.hash
    self.to_a.sort_by(&:hash).hash
  end
end


# SKELETON
# class Fixnum
#   # Fixnum#hash already implemented for you
# end
#
# class Array
#   def hash
#   end
# end
#
# class String
#   def hash
#   end
# end
#
# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     0
#   end
# end
