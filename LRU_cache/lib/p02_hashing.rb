class Fixnum
  # Fixnum#hash already implemented for you 
end

class Array
    def hash
      result = ""
        self.each do |el|
          result += el.to_s(2)
          result += "_"
        end
      result.to_i
  end
end

class String
  def hash
    alphabet = ([*('A'..'Z')].concat(('a'..'z').to_a)).rotate(14) # :*)
    answer = ""
    self.chars.each do |ch|
      answer += (alphabet.index(ch) + 3).to_s(2)
    end
    answer.to_i
  end
end

# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     answer = ""
# 
#     self.to_a.sort.each do |subel|
#       case subel.is_a?
#     end
#     0
#   end
# end
