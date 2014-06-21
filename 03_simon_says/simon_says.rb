def echo(message)
  message
end

def shout(message)
  message.upcase
end

def repeat(message, count=2)
  ([message] * count).join(" ")
end 

def start_of_word(word, count)
  word[0, count]
end

def first_word(sentence)
  sentence.split.first
end

def titleize(sentence)
  words = sentence.split

  # always capitalize the first word
  first_word = words.shift.capitalize

  # subject subsequent words to exclusion rule
  exclusions = {
    # articles
    'the' => true,

    # conjunctions
    'and' => true,

    # prepositions
    'over' => true,
  }
  capitalized = words.map {|word| exclusions.has_key?(word) ? word : word.capitalize }

  # add first word back to the front of the array
  capitalized.unshift(first_word)
  capitalized.join(' ')
end
