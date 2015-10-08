module Enumerable
  #array.each { |num| puts num }
  def my_each &block
    self.length.times do |index|
      yield self[index]
    end
    return self
  end
  def my_each_with_index &block
    self.length.times do |index|
      yield self[index], index
    end
    return self
  end
  def my_select &block
    new_arr = Array.new()
    self.my_each do |item|
      if yield item
        new_arr << item
      end
    end
    new_arr
  end
  def my_all?
    self.my_each do |item|
      if block_given?
        return false unless yield item
      else
        return false unless item
      end
    end
    true
  end
  def my_any? &block
    self.my_each do |item|
      return true if yield item
    end
    false
  end
  def my_none? &block
    self.my_each do |item|
      return false if yield item
    end
    true
  end
  def my_count &block
    count = 0
    self.my_each do |item|
      count += 1 if yield item
    end
    count
  end
  def my_map &block
    self.length.times do |index| 
      self[index] = yield index
    end
    self
  end
  def my_inject(initial = nil)
		initial = self[0] if initial.nil?
		memo = initial
		self.my_each { |element| memo = yield(memo, element) }
		memo
	end
	def multiply_els arr
	  arr.my_inject(1) { |sumproduct, val | sumproduct = sumproduct*val }
	end
end