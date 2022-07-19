def merge_sort(numbers)
  if numbers.size < 2
    return numbers
  end

  array_size   = numbers.size
  half_of_size = (array_size / 2).round

  left_array  = numbers.take(half_of_size)
  right_array = numbers.drop(half_of_size)

  sorted_left_array = merge_sort(left_array)
  sorted_right_array = merge_sort(right_array)

  merge(sorted_left_array, sorted_right_array)
end

def merge(left_array, right_array)
  if right_array.empty?
    return left_array
  end

  if left_array.empty?
    return right_array
  end

  smallest_number = if left_array.first <= right_array.first
                      left_array.shift
                    else
                      right_array.shift
                    end

  recursive = merge(left_array, right_array)

  [smallest_number].concat(recursive)
end

p merge_sort([4, 92, 1, 39, 19, 93, 49, 10])
