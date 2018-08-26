# Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

def substring(phrase, words)
	substrings = {}

	words.each do |word|
		occurrences = phrase.downcase.scan(/#{word}/)
		substrings["#{word}"] = occurrences.length
		substrings.delete_if {|key, value| value == 0}
	end

	puts substrings
end

substring("im going to the beach",['a','go','he'])
