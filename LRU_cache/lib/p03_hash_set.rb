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
