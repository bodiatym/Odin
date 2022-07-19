module Enumerable
  def my_map
    new_array = []
    self.my_each { |element| new_array << yield(element) }
    new_array
  end

  def my_each_with_index
    index = 0
    for element in self
      yield element, index
      index += 1
    end
  end

  def my_all?
    self.my_each { |element| return false if yield(element) == false }
    true
  end

  def my_any?
    self.my_each { |element| return true if yield(element) == true }
    false
  end

  def my_none?
    self.my_each { |element| return false if yield(element) == true }
    true
  end

  def my_count
    counter = 0
    self.my_each do |element|
      if block_given?
        counter += 1 if yield(element) == true
      else
        counter += 1
      end
    end
    counter
  end

  def my_select
    new_array = []
    self.my_each { |element| new_array << element if yield(element) == true }
    new_array
  end

  def my_inject(start_value = 0)
    result = start_value
    self.my_each { |element| result = yield(result, element) }
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for element in self
      yield element
    end
    self
  end
end
