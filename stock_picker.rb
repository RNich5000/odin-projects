def stock_picker(stocks)
  diff_list = stocks.combination(2).to_a
  profit_list = Array.new
  best_combo = Array.new

  diff_list.each do |combo|
    profit = combo[1]-combo[0]
    profit_list.push(profit)
    if combo[1]-combo[0] == profit_list.max
      best_combo.push(combo)
    end
  end
  p "#{best_combo.last} for a profit of #{profit_list.max}"
end

stock_picker([17,3,6,9,15,8,6,1,10])
