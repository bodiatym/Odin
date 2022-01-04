def caesar_cipher(string, shift_factor)
  p alphabet_lower = ('a'..'z').to_a
  p alphabet_upper = ('A'..'Z').to_a

  letter_count = 26

  string_arr = string.split("")

  new_string = string_arr.map do |char|
    if alphabet_lower.include?(char)
      index = alphabet_lower.index(char)
      if index + shift_factor >= letter_count
        new_index = (index+shift_factor) % letter_count
      else
        new_index = index + shift_factor
      end
      char = alphabet_lower[new_index]
    elsif alphabet_upper.include?(char)
    index = alphabet_upper.index(char)
      if index + shift_factor >= letter_count
        new_index = (index+shift_factor) % letter_count
      else
        new_index = index + shift_factor
      end
      char = alphabet_upper[new_index]
    else
      char
    end
  end
  new_string.join
end

print caesar_cipher("What a string!", 5)