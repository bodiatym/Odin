
def substring(text, dictionary)
  result = {}
  lowered_text = text.downcase

  dictionary.each do |word|
    substrings_count = lowered_text.scan(word).count
    result[word] = substrings_count unless substrings_count == 0
  end

  result
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

p substring("Howdy partner, sit down! How's it going?", dictionary)