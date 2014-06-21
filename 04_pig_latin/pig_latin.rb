# pig_latin.rb

def translate(sentence)
  words = sentence.split
  latinized_words = words.map do |word|
    if first_vowel?(word)
      "#{word}ay"
    else
      prefix = extract_leading_phonemes(word)
      prefix_len = prefix.length
      remaining_letters = word[prefix_len..-1]
      "#{remaining_letters}#{prefix}ay"
    end
  end

  latinized_words.join(' ')
end

#### utility methods

def extract_leading_phonemes(word)
  word =~ /^(sch|qu|[^aeiou])+/ ? $& : ''
end

def first_vowel?(word)
  word.size > 0 && is_vowel?(word[0])
end

def is_vowel?(letter)
  letter =~ /^[aeiou]$/
end

def leading_consonants?(word, count)
  if word.size >= count
    leading_letters = word[0, count]
    leading_letters.each_char {|ltr| return false if is_vowel?(ltr) }
    true
  end
end
