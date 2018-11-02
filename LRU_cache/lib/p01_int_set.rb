require 'byebug'

class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max){false}
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    insertion_point = num % @store.length
    @store[insertion_point] << num
  end

  def remove(num)
    removed = false
    @store.each do |bucket|
      break if removed == true
      if bucket.include?(num)
        bucket.delete(num)
        removed = true
      end
    end
  end

  def include?(num)
    #debugger
    @store.each do |bucket|
      return true if bucket.include?(num)
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self[num].include?(num)
      
      self[num] << num 
      @count += 1
      resize
    
    end
    
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    return true if self[num].include?(num)
    false
  end
  
  def idx(num)
    num % @store.length
  end
  
  def resize
    resize! if count == @store.length 
  end
  
  private

  def [](num)
    @store[idx(num)]
  end

  def num_buckets
    @store.length
  end

  def resize!
    all_nums = @store.dup.flatten
    @store = Array.new(count * 2) { Array.new }
    @count = 0
    
    all_nums.each do |num|
      insert(num)
    end      
  end
end
