def stock_picker(stock_prices)
	buy_day = 0
	sell_day = 0
	max_value = 0
	if stock_prices.length > 1
		(stock_prices.length-1).times do |buy_idx|
			(buy_idx+1).upto(stock_prices.length-1) do |sell_idx|
				potential_new_max = stock_prices[sell_idx] - stock_prices[buy_idx]
				if max_value  < potential_new_max
					buy_day = buy_idx
					sell_day = sell_idx
					max_value = potential_new_max
				end
			end
		end
	end
	puts [buy_day, sell_day].to_s

end

stock_picker([17,5,15,6,8,2,1,3])
