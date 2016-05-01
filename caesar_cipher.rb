def cipher(word, num)
	alphabet = ('a'..'z').to_a.concat(('A'..'Z').to_a) # or << ? 
		new_word = " " 


		word.each_char do |i|
			if !alphabet.include?(i)
				new_word += i
			else
				new_word += alphabet[alphabet.index(i.downcase) - num]
			end
		end



		return new_word.downcase.capitalize
	end


	puts cipher("holla at me", 3)
