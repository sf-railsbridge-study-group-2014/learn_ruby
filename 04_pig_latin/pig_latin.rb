def translate(sentence)
  words = sentence.split
  latinized_words = words.map do |word|
    if first_vowel?(word)
      "#{word}ay"
    else
      consonants = extract_initial_consonants(word)
      cons_len = consonants.length
      remaining_letters = word[cons_len..-1]
      "#{remaining_letters}#{consonants}ay"
    end
  end

  latinized_words.join(' ')
end

#### utility methods

def extract_initial_consonants(word)
  consonants = []
  word.each_char do |ltr|
    if is_vowel?(ltr)
      break
    else
      consonants << ltr
    end
  end
  consonants.join
end

def first_vowel?(word)
  word.size > 0 && is_vowel?(word[0])
end

def is_vowel?(letter)
  vowels.has_key? letter
end

def leading_consonants?(word, count)
  if word.size >= count
    leading_letters = word[0, count]
    leading_letters.each_char {|ltr| return false if is_vowel?(ltr) }
    true
  end
end

def vowels
  {
    'a' => true,
    'e' => true,
    'i' => true,
    'o' => true,
    'u' => true,
  }
end

