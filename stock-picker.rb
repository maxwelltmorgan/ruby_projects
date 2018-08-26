# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

def stock_picker(stocks)
	pairs = {}

	stocks.each do |buy|
		stocks.each do |sell|
			next if stocks.index(sell) < stocks.index(buy)
			pairs[[stocks.index(buy), stocks.index(sell)]] = sell - buy
		end
	end
	print pairs.key(pairs.values.max)
end

stock_picker([17,3,6,9,15,8,6,1,10])
