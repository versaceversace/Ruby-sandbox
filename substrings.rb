def search_dictionary(word, dictionary)
	group_sizes = word.length
	results = {}
	word.downcase!
	group_sizes.times do |group_size|
		group_size.upto(group_sizes-1) do |group|
			idx_end = group
			idx_begin = idx_end - group_size
			new_word = word[idx_begin..idx_end]
			new_word_dict_count = dictionary.count(new_word)
			if new_word_dict_count > 0
				results[new_word] = new_word_dict_count
			end
		end
	end
	return results

end

def merge_hashes(destination_hash, source_hash)
	source_hash.keys.each do |key|
		if destination_hash.key?(key)
			destination_hash[key] += source_hash[key]
		else
			destination_hash[key] = source_hash[key]
		end
	end
	return destination_hash
end

def substrings(search_words, dictionary)
	results = {}
	search_words.scan(/[A-Za-z]+'?[A-Za-z]*/) do |word|
		these_results = search_dictionary(word, dictionary)
		results = merge_hashes(results, these_results)

	end
	puts results
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)
