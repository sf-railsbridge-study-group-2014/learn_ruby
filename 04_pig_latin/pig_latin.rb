# pig_latin.rb

def translate(sentence)
  words = sentence.split
  transformed_words = words.map do |word|
    punctuation_idx = (word =~ /\W*$/)
    punctuation = word[punctuation_idx..-1]
    stripped_word = word[0...punctuation_idx]

    transformed = apply_pig_latin_rules(stripped_word)
    "#{transformed}#{punctuation}"
  end

  transformed_words.join(' ')
end

#### utility methods

def apply_pig_latin_rules(word)
  if first_vowel?(word)
    "#{word}ay"
  else
    was_capitalized = word[0].capitalize == word[0]

    prefix = extract_leading_phonemes(word).downcase
    prefix_len = prefix.length

    remaining_letters = word[prefix_len..-1]
    remaining_letters.capitalize! if was_capitalized
    "#{remaining_letters}#{prefix}ay"
  end
end

def extract_leading_phonemes(word)
  word =~ /^(sch|qu|[^aeiou])+/i ? $& : ''
end

def first_vowel?(word)
  word.size > 0 && is_vowel?(word[0])
end

def is_vowel?(letter)
  letter =~ /^[aeiou]$/i
end

def leading_consonants?(word, count)
  if word.size >= count
    leading_letters = word[0, count]
    leading_letters.each_char {|ltr| return false if is_vowel?(ltr) }
    true
  end
end
