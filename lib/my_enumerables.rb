module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    self.my_each do |elem|
      yield(elem, i)
      i += 1
    end
  end

  def my_select
    arr = []
    self.each do |elem|
      arr << elem if yield(elem)
    end
    arr
  end

  def my_all?
    self.each do |elem|
      return false if yield(elem) == false
    end
    true
  end

  def my_any?
    self.each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_none?
    self.each do |elem|
      return false if yield(elem)
    end
    true
  end

  def my_count
    return self.length unless block_given?
    count = 0
    self.each do |elem|
      count += 1 if yield(elem)
    end
    count
  end

  def my_map
    arr = []
    self.each do |elem|
      arr << yield(elem)
    end
    arr
  end

  def my_inject(initial_value)
    sum = initial_value
    arr = []
    self.my_each do |elem|
      sum = yield(sum, elem)
      arr << sum
    end
    arr[-1]
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end
end
